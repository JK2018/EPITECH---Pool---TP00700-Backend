alias Timemanagerbackend.Repo
alias Timemanagerbackend.User
alias Timemanagerbackend.Team
alias Timemanagerbackend.Roles
alias Timemanagerbackend.Clock
alias Timemanagerbackend.WorkingTime

boss =
  Repo.insert!(%Roles{
    label: "general_manager"
  })
  |> Repo.preload(:users)

# manager =
#   Repo.insert!(%Roles{
#     label: "manager"
#   })
#   |> Repo.preload(:users)

userRole =
  Repo.insert!(%Roles{
    label: "user"
  })
  |> Repo.preload(:users)

# Ecto.put_assoc()

workingtime = Repo.insert!(%WorkingTime{})
workingtime2 = Repo.insert!(%WorkingTime{})
# workingtime3 = Repo.insert!(%WorkingTime{})

clock = Repo.insert!(%Clock{}) |> Repo.preload(:user)
clock2 = Repo.insert!(%Clock{}) |> Repo.preload(:user)
clock3 = Repo.insert!(%Clock{}) |> Repo.preload(:user)
clock4 = Repo.insert!(%Clock{}) |> Repo.preload(:user)

team =
  Repo.insert!(%Team{name: "Team yoda", description: "La team de la force"})
  |> Repo.preload(:users)

team2 =
  Repo.insert!(%Team{name: "Team darth vader", description: "La team du coté obscur"})
  |> Repo.preload(:users)

user =
  Repo.insert!(%User{
    username: "PMax",
    firstname: "Max",
    lastname: "Payne",
    email: "chinthaka@live.com",
    password: "mdptresdur9876"
  })
  |> Repo.preload([:clock, :team, :workingtimes])

user2 =
  Repo.insert!(%User{
    username: "SaldaZo",
    firstname: "Zoe",
    lastname: "Saldana",
    email: "avatar@live.com",
    password: "jasksully"
  })
  |> Repo.preload([:clock, :team, :workingtimes])

user3 =
  Repo.insert!(%User{
    username: "Jcvd",
    firstname: "Jean-claude",
    lastname: "vandamme",
    email: "jcvd@gmail.com",
    password: "jadorelo2030"
  })
  |> Repo.preload([:clock, :team, :workingtimes])

user4 =
  Repo.insert!(%User{
    username: "Boser2000",
    firstname: "Nabil",
    lastname: "Payne",
    email: "boser@verizon.net",
    password: "seededpwd2"
  })
  |> Repo.preload([:clock, :team, :workingtimes])

userRole
|> Ecto.Changeset.change()
|> Ecto.Changeset.put_assoc(:users, [user])
|> Repo.update!()

boss
|> Ecto.Changeset.change()
|> Ecto.Changeset.put_assoc(:users, [user4])
|> Repo.update!()

clock
|> Ecto.Changeset.change()
|> Ecto.Changeset.put_assoc(:user, user)
|> Repo.update!()

clock2
|> Ecto.Changeset.change()
|> Ecto.Changeset.put_assoc(:user, user2)
|> Repo.update!()

clock3
|> Ecto.Changeset.change()
|> Ecto.Changeset.put_assoc(:user, user3)
|> Repo.update!()

clock4
|> Ecto.Changeset.change()
|> Ecto.Changeset.put_assoc(:user, user4)
|> Repo.update!()

team
|> Ecto.Changeset.change()
|> Ecto.Changeset.put_assoc(:users, [user, user2])
|> Repo.update!()

team2
|> Ecto.Changeset.change()
|> Ecto.Changeset.put_assoc(:users, [user3, user4])
|> Repo.update!()

user
|> Ecto.Changeset.change()
|> Ecto.Changeset.put_assoc(:workingtimes, [workingtime, workingtime2])
|> Repo.update!()

# Repo.insert!(user2)
# Repo.insert!(user3)
# Repo.insert!(user4)

# Ecto.build_assoc(teamOne, :users, user4)
