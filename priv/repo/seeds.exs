alias App.Accounts
alias App.Documents

{:ok, current_user} = Accounts.create_user(%{ email: "wbotelhos@gmail.com", password: "123mudar" })

[
  %{
    current_user: current_user,
    name: "Gênesis",
    position: 1,
    verses: [
      %{
        body: "No princípio, criou Deus os céus e a terra.",
        chapter: 1,
        number: 1
      },
      %{
        body:
          "A terra, porém, estava sem forma e vazia; havia trevas sobre a face do abismo, e o Espírito de Deus pairava por sobre as águas.",
        chapter: 1,
        number: 2
      }
    ]
  },
  %{
    current_user: current_user,
    name: "Êxodo",
    position: 2,
    verses: [
      %{
        body:
          "São estes os nomes dos filhos de Israel que entraram com Jacó no Egito; cada um entrou com sua família:",
        chapter: 1,
        number: 1
      },
      %{
        body: "Rúben, Simeão, Levi e Judá,",
        chapter: 1,
        number: 2
      }
    ]
  },
  %{
    current_user: current_user,
    name: "Levítico",
    position: 3,
    verses: [
      %{
        body: "Chamou o Senhor a Moisés e, da tenda da congregação, lhe disse:",
        chapter: 1,
        number: 1
      },
      %{
        body:
          "Fala aos filhos de Israel e dize-lhes: Quando algum de vós trouxer oferta ao Senhor, trareis a vossa oferta de gado, de rebanho ou de gado miúdo.",
        chapter: 1,
        number: 2
      }
    ]
  }
]
|> Enum.each(fn attrs ->
  {:ok, book} = Documents.create_book(attrs)

  attrs
  |> Map.get(:verses)
  |> Enum.each(fn verse_attrs ->
    verse_attrs
    |> Map.put(:book_id, book.id)
    |> Documents.create_verse()
  end)
end)
