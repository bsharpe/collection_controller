require "collection_controller/version"

module CollectionController
  extend ActiveSupport::Concern

  protected

  def collection
    @collection ||= controller_name.classify.constantize
  end

  def member
    @member ||= begin
      if member_is_one?
        model_name = controller_name.singularize
        collection.send(model_name) || collection.send("build_#{model_name}")
      else
        params[:id] ? find_member(params[:id]) : build_member
      end
    end
  end

  def find_member(id)
    @member = collection.find(id)
  end

  def build_member(attrs = nil)
    @member = begin
      if member_is_one?
        collection.send(controller_name.singularize) || collection.send("build_#{controller_name.singularize}")
      else
        collection.respond_to?(:new) ? collection.new(attrs) : collection.build(attrs)
      end
    end
  end

  def member_association
    @_member_association ||= begin
      if collection.class.respond_to?(:reflect_on_association)
        collection.class.reflect_on_association(controller_name.singularize)&.macro
      end
    end
  end

  def member_is_one?
    member_association == :has_one
  end

  def member=(new_value)
    @member = new_value
  end

  def collection=(new_value)
    @collection = new_value
  end

  def current_page
    collection.page(page_number)
  end

  def page_number
    params[:page] ? params[:page][:number] : 1
  end
end
