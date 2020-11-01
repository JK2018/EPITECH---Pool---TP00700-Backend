alias Timemanagerbackend.Repo
alias Timemanagerbackend.User
alias Timemanagerbackend.Roles
alias Timemanagerbackend.Clock
alias Timemanagerbackend.WorkingTime

boss =
  Repo.insert!(%Roles{
    label: "general_manager"
  })

clock = Repo.insert!(%Clock{})
clock2 = Repo.insert!(%Clock{})
clock3 = Repo.insert!(%Clock{})

manager =
  Repo.insert!(%Roles{
    label: "manager"
  })

userRole =
  Repo.insert!(%Roles{
    label: "user"
  })

user =
  Ecto.build_assoc(userRole, :users, %User{
    username: "PMax",
    firstname: "Max",
    lastname: "Payne",
    email: "chinthaka@live.com",
    password: "mdptresdur9876"
  })

user6 =
  Ecto.build_assoc(userRole, :users, %User{
    username: "SaldaZo",
    firstname: "Zoe",
    lastname: "Saldana",
    email: "avatar@live.com",
    password: "jasksully"
  })

user7 =
  Ecto.build_assoc(userRole, :users, %User{
    username: "Jcvd",
    firstname: "Jean-claude",
    lastname: "vandamme",
    email: "jcvd@gmail.com",
    password: "jadorelo2030"
  })

user2 =
  Ecto.build_assoc(userRole, :users, %User{
    username: "Boser2000",
    firstname: "Nabil",
    lastname: "Payne",
    email: "boser@verizon.net",
    password: "seededpwd2"
  })

user3 =
  Ecto.build_assoc(manager, :users, %User{
    username: "Bamakeau",
    firstname: "Rocco",
    lastname: "Fowler",
    email: "smallpaul@sbcglobal.net",
    password: "seededpwd3"
  })

user4 =
  Ecto.build_assoc(manager, :users, %User{
    username: "Ericson",
    firstname: "Eric",
    lastname: "Weston",
    email: "multiplx@mac.com",
    password: "seededpwd4"
  })

user5 =
  Ecto.build_assoc(boss, :users, %User{
    username: "Zonema",
    firstname: "Jeff",
    lastname: "Bezos",
    email: "bossdugame@amazon.com",
    password: "fuckmywifeshedestroyme12345"
  })

work = Repo.insert!(%WorkingTime{})
work2 = %WorkingTime{}
work3 = Repo.insert!(%WorkingTime{})
worktest = Ecto.build_assoc(user2, :workingtimes, work2)
Repo.insert!(worktest)

clocked =
  Ecto.build_assoc(clock, :users, %User{
    username: "sqdf",
    firstname: "qsdf",
    lastname: "qsdf",
    email: "sqfsqdf@amazon.com",
    password: "fuckmywifeshedestroyme12345",
    workingtimes: [work, work3]
  })

Repo.insert!(user)
Repo.insert!(clocked)
Repo.insert!(Ecto.build_assoc(clock2, :users, user5))
Repo.insert!(Ecto.build_assoc(clock3, :users, user7))

Repo.insert!(user2)
Repo.insert!(user3)
Repo.insert!(user4)
