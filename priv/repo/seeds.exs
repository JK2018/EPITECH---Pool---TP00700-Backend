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

manager =
  Repo.insert!(%Roles{
    label: "manager"
  })
  |> Repo.preload(:users)

userRole =
  Repo.insert!(%Roles{
    label: "user"
  })
  |> Repo.preload(:users)

# Ecto.put_assoc()

# team 1
workingtime = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-02T05:13:54"), end: NaiveDateTime.from_iso8601!("2020-11-02T11:13:53")})
workingtime2 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-02T12:13:54"), end: NaiveDateTime.from_iso8601!("2020-11-02T15:13:53")})
workingtime3 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-03T07:45:24"), end: NaiveDateTime.from_iso8601!("2020-11-03T16:13:53")})
workingtime4 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-04T06:03:54"), end: NaiveDateTime.from_iso8601!("2020-11-04T18:53:53")})
workingtime5 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-05T06:53:54"), end: NaiveDateTime.from_iso8601!("2020-11-05T17:33:53")})
workingtime6 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-06T05:43:54"), end: NaiveDateTime.from_iso8601!("2020-11-06T15:33:53")})

workingtime7 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-02T06:13:54"), end: NaiveDateTime.from_iso8601!("2020-11-02T16:23:53")})
workingtime8 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-02T04:13:54"), end: NaiveDateTime.from_iso8601!("2020-11-03T19:03:53")})
workingtime9 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-03T08:15:24"), end: NaiveDateTime.from_iso8601!("2020-11-05T16:03:53")})
workingtime10 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-04T06:09:54"), end: NaiveDateTime.from_iso8601!("2020-11-04T15:33:53")})
workingtime11 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-05T04:56:54"), end: NaiveDateTime.from_iso8601!("2020-11-05T17:03:53")})
workingtime12 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-06T04:43:54"), end: NaiveDateTime.from_iso8601!("2020-11-06T14:53:53")})

workingtime13 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-02T09:19:54"), end: NaiveDateTime.from_iso8601!("2020-11-02T12:33:53")})
workingtime14 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-03T08:46:24"), end: NaiveDateTime.from_iso8601!("2020-11-05T16:03:53")})
workingtime15 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-04T04:09:54"), end: NaiveDateTime.from_iso8601!("2020-11-03T20:03:53")})
workingtime16 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-05T07:26:54"), end: NaiveDateTime.from_iso8601!("2020-11-04T13:33:53")})
workingtime17 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-06T04:13:54"), end: NaiveDateTime.from_iso8601!("2020-11-06T18:53:53")})

workingtime18 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-02T09:23:54"), end: NaiveDateTime.from_iso8601!("2020-11-02T11:53:53")})
workingtime19 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-03T10:46:24"), end: NaiveDateTime.from_iso8601!("2020-11-03T21:53:53")})
workingtime20 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-04T07:19:54"), end: NaiveDateTime.from_iso8601!("2020-11-04T17:53:53")})
workingtime21 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-05T08:36:54"), end: NaiveDateTime.from_iso8601!("2020-11-05T17:13:53")})
workingtime22 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-06T05:33:54"), end: NaiveDateTime.from_iso8601!("2020-11-06T17:53:53")})

workingtime23 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-02T07:11:54"), end: NaiveDateTime.from_iso8601!("2020-11-02T18:33:53")})
workingtime24 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-03T08:31:24"), end: NaiveDateTime.from_iso8601!("2020-11-03T17:53:53")})
workingtime25 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-04T04:09:54"), end: NaiveDateTime.from_iso8601!("2020-11-04T13:59:53")})
workingtime26 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-05T09:56:54"), end: NaiveDateTime.from_iso8601!("2020-11-05T15:55:53")})
workingtime27 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-06T04:53:54"), end: NaiveDateTime.from_iso8601!("2020-11-06T19:53:53")})

#team1
workingtime28 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-02T05:13:54"), end: NaiveDateTime.from_iso8601!("2020-11-02T11:13:53")})
workingtime29 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-02T12:13:54"), end: NaiveDateTime.from_iso8601!("2020-11-02T15:13:53")})
workingtime30 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-03T07:45:24"), end: NaiveDateTime.from_iso8601!("2020-11-03T16:13:53")})
workingtime31 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-04T06:03:54"), end: NaiveDateTime.from_iso8601!("2020-11-04T18:53:53")})
workingtime32 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-05T06:53:54"), end: NaiveDateTime.from_iso8601!("2020-11-05T17:33:53")})
workingtime33 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-06T05:43:54"), end: NaiveDateTime.from_iso8601!("2020-11-06T15:33:53")})

workingtime34 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-02T06:13:54"), end: NaiveDateTime.from_iso8601!("2020-11-02T16:23:53")})
workingtime35 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-02T04:13:54"), end: NaiveDateTime.from_iso8601!("2020-11-03T19:03:53")})
workingtime36 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-03T08:15:24"), end: NaiveDateTime.from_iso8601!("2020-11-05T16:03:53")})
workingtime37 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-04T06:09:54"), end: NaiveDateTime.from_iso8601!("2020-11-04T15:33:53")})
workingtime38 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-05T04:56:54"), end: NaiveDateTime.from_iso8601!("2020-11-05T17:03:53")})
workingtime39 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-06T04:43:54"), end: NaiveDateTime.from_iso8601!("2020-11-06T14:53:53")})

workingtime40 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-02T09:19:54"), end: NaiveDateTime.from_iso8601!("2020-11-02T12:33:53")})
workingtime41 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-03T08:46:24"), end: NaiveDateTime.from_iso8601!("2020-11-05T16:03:53")})
workingtime42 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-04T04:09:54"), end: NaiveDateTime.from_iso8601!("2020-11-03T20:03:53")})
workingtime43 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-05T07:26:54"), end: NaiveDateTime.from_iso8601!("2020-11-04T13:33:53")})
workingtime44 = Repo.insert!(%WorkingTime{start: NaiveDateTime.from_iso8601!("2020-11-06T04:13:54"), end: NaiveDateTime.from_iso8601!("2020-11-06T18:53:53")})



# workingtime3 = Repo.insert!(%WorkingTime{})

clock = Repo.insert!(%Clock{}) |> Repo.preload(:user)
clock2 = Repo.insert!(%Clock{}) |> Repo.preload(:user)
clock3 = Repo.insert!(%Clock{}) |> Repo.preload(:user)
clock4 = Repo.insert!(%Clock{}) |> Repo.preload(:user)
clock5 = Repo.insert!(%Clock{}) |> Repo.preload(:user)
clock6 = Repo.insert!(%Clock{}) |> Repo.preload(:user)
clock7 = Repo.insert!(%Clock{}) |> Repo.preload(:user)
clock8 = Repo.insert!(%Clock{}) |> Repo.preload(:user)

team =
  Repo.insert!(%Team{name: "Team yoda", description: "La team de la force"})
  |> Repo.preload(:users)

team2 =
  Repo.insert!(%Team{name: "Team darth vader", description: "La team du coté obscur"})
  |> Repo.preload(:users)

user =
  Repo.insert!(%User{
    username: "user",
    firstname: "user",
    lastname: "user",
    email: "user@user.com",
    password: "user"
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
    username: "TheBoss",
    firstname: "Jeff",
    lastname: "Bezos",
    email: "admin@admin.com",
    password: "admin"
  })
  |> Repo.preload([:clock, :team, :workingtimes])

user5 =
  Repo.insert!(%User{
    username: "SimpleManager",
    firstname: "Jeff",
    lastname: "Bezos",
    email: "manager@manager.com",
    password: "manager"
  })
  |> Repo.preload([:clock, :team, :workingtimes])

  user6 =
  Repo.insert!(%User{
    username: "SimpleManager2",
    firstname: "Jeffy",
    lastname: "Bouzos",
    email: "manager2@manager.com",
    password: "manager2"
  })
  |> Repo.preload([:clock, :team, :workingtimes])

  user7 =
  Repo.insert!(%User{
    username: "Jcvd2",
    firstname: "Jean-cloud",
    lastname: "vandamn",
    email: "jcvd2@gmail.com",
    password: "jadorelo20302"
  })
  |> Repo.preload([:clock, :team, :workingtimes])

  user8 =
  Repo.insert!(%User{
    username: "Jcvd3",
    firstname: "Jean-jacques",
    lastname: "vandammes",
    email: "jcvd3@gmail.com",
    password: "jadorelo20303"
  })
  |> Repo.preload([:clock, :team, :workingtimes])


userRole
|> Ecto.Changeset.change()
|> Ecto.Changeset.put_assoc(:users, [user, user2, user3, user7, user8])
|> Repo.update!()

manager
|> Ecto.Changeset.change()
|> Ecto.Changeset.put_assoc(:users, [user5, user6])
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

clock5
|> Ecto.Changeset.change()
|> Ecto.Changeset.put_assoc(:user, user5)
|> Repo.update!()

clock6
|> Ecto.Changeset.change()
|> Ecto.Changeset.put_assoc(:user, user6)
|> Repo.update!()

clock7
|> Ecto.Changeset.change()
|> Ecto.Changeset.put_assoc(:user, user7)
|> Repo.update!()

clock8
|> Ecto.Changeset.change()
|> Ecto.Changeset.put_assoc(:user, user8)
|> Repo.update!()

team
|> Ecto.Changeset.change()
|> Ecto.Changeset.put_assoc(:users, [user, user2, user3, user4, user5])
|> Repo.update!()

team2
|> Ecto.Changeset.change()
|> Ecto.Changeset.put_assoc(:users, [user6, user7, user8])
|> Repo.update!()

user
|> Ecto.Changeset.change()
|> Ecto.Changeset.put_assoc(:workingtimes, [workingtime, workingtime2, workingtime3, workingtime4, workingtime5, workingtime6])
|> Repo.update!()

user2
|> Ecto.Changeset.change()
|> Ecto.Changeset.put_assoc(:workingtimes, [workingtime7, workingtime8, workingtime9 ,workingtime10, workingtime11, workingtime12])
|> Repo.update!()

user3
|> Ecto.Changeset.change()
|> Ecto.Changeset.put_assoc(:workingtimes, [workingtime13, workingtime14, workingtime15, workingtime16, workingtime17])
|> Repo.update!()

user4
|> Ecto.Changeset.change()
|> Ecto.Changeset.put_assoc(:workingtimes, [workingtime18, workingtime19, workingtime20, workingtime21, workingtime22])
|> Repo.update!()

user5
|> Ecto.Changeset.change()
|> Ecto.Changeset.put_assoc(:workingtimes, [workingtime23, workingtime24, workingtime25, workingtime26, workingtime27])
|> Repo.update!()

user6
|> Ecto.Changeset.change()
|> Ecto.Changeset.put_assoc(:workingtimes, [workingtime28, workingtime29, workingtime30, workingtime31, workingtime32])
|> Repo.update!()

user7
|> Ecto.Changeset.change()
|> Ecto.Changeset.put_assoc(:workingtimes, [workingtime33, workingtime34, workingtime35, workingtime36, workingtime37])
|> Repo.update!()

user8
|> Ecto.Changeset.change()
|> Ecto.Changeset.put_assoc(:workingtimes, [workingtime38, workingtime39, workingtime40, workingtime41, workingtime42])
|> Repo.update!()

# Repo.insert!(user2)
# Repo.insert!(user3)
# Repo.insert!(user4)

# Ecto.build_assoc(teamOne, :users, user4)
