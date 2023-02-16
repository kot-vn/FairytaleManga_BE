class ReaderSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :age, :phonenumber, :ban, :score, :show_gender, :address

  def show_gender
    if object.gender == false
      return "male"
    else
      return "female"
    end
  end
end
