defmodule Person do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          id: integer,
          email: String.t(),
          phones: [Person.PhoneNumber.t()]
        }
  defstruct [:name, :id, :email, :phones]

  field :name, 1, type: :string
  field :id, 2, type: :int32
  field :email, 3, type: :string
  field :phones, 4, repeated: true, type: Person.PhoneNumber
end

defmodule Person.PhoneNumber do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          number: String.t(),
          type: atom | integer
        }
  defstruct [:number, :type]

  field :number, 1, type: :string
  field :type, 2, type: Person.PhoneType, enum: true
end

defmodule Person.PhoneType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field :MOBILE, 0
  field :HOME, 1
  field :WORK, 2
end

defmodule AddressBook do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          people: [Person.t()]
        }
  defstruct [:people]

  field :people, 1, repeated: true, type: Person
end
