
alias BlogApp.Repo
alias BlogApp.Accounts.User
alias BlogApp.Blog.Post

# Create 10 seed users

for _ <- 1..10 do
    Repo.insert!(%User{
          name: Faker.Name.name,
          email: Faker.Internet.safe_email
                 })
end

# Create 40 seed posts

for _ <- 1..40 do
    Repo.insert!(%Post{
          title: Faker.Lorem.sentence,
          body: Faker.Lorem.sentences(%Range{first: 1, last: 3}) |> Enum.join("\n\n"),
          accounts_users_id: Enum.random(1..10)
                 })
end
