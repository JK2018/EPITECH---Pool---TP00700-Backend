alias Timemanagerbackend.Repo
alias Timemanagerbackend.User
alias Timemanagerbackend.Roles

boss =
  Repo.insert!(%Roles{
    label: "general_manager"
  })

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

Repo.insert!(user)
Repo.insert!(user2)
Repo.insert!(user3)
Repo.insert!(user4)
Repo.insert!(user5)
Repo.insert!(user6)
Repo.insert!(user7)

# query = from(p in Roles, where: p.label == "manager")
# geted = Repo.get(Roles, 2)
