USE [dbDoors]
GO
/****** Object:  User [admin1]    Script Date: 14.12.2020 01:07:16 ******/
CREATE USER [admin1] FOR LOGIN [admin1] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [admin1]
GO
ALTER ROLE [db_datareader] ADD MEMBER [admin1]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [admin1]
GO
/****** Object:  Table [dbo].[Katalog]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Katalog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [varchar](50) NOT NULL,
	[CenaNetto] [decimal](10, 2) NOT NULL,
	[Vat] [int] NOT NULL,
	[Obraz] [image] NOT NULL,
	[Typ] [varchar](50) NULL,
 CONSTRAINT [PK_Katalog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klienci]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klienci](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [varchar](50) NOT NULL,
	[AdresFakturyL1] [varchar](50) NOT NULL,
	[AdresFakturyL2] [varchar](50) NOT NULL,
	[NIP] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[AdresWysylkiL1] [varchar](50) NULL,
	[AdresWysylkiL2] [varchar](50) NULL,
	[Telefon] [varchar](50) NULL,
	[Id_Sklepu] [int] NULL,
 CONSTRAINT [PK_Klienci] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sklepy]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sklepy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [varchar](50) NOT NULL,
	[AdresL1] [varchar](50) NOT NULL,
	[AdresL2] [varchar](50) NOT NULL,
	[NIP] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Haslo] [varchar](50) NOT NULL,
	[Status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Sklepy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uzytkownicy]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uzytkownicy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Imie] [varchar](50) NULL,
	[Nazwisko] [varchar](50) NULL,
	[Login] [varchar](6) NULL,
	[Haslo] [varchar](6) NULL,
	[UCKatalog] [bit] NULL,
	[UCSklepy] [bit] NULL,
	[UCRealizacjaZam] [bit] NULL,
	[UCWysylki] [bit] NULL,
	[UCAnalizy] [bit] NULL,
	[UCHistoriaWys] [bit] NULL,
	[UCRozliczeniaProd] [bit] NULL,
	[UCUzytkownicy] [bit] NULL,
 CONSTRAINT [PK_Uzytkownicy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wysylki]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wysylki](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NrZamowienia] [int] NOT NULL,
	[NrListu] [varchar](50) NULL,
	[Spedytor] [varchar](50) NULL,
	[DataWysylki] [date] NULL,
	[StatusEmail] [varchar](50) NULL,
 CONSTRAINT [PK_Wysylki] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zamowienia]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zamowienia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Sklepu] [int] NULL,
	[Id_Klienta] [int] NULL,
	[Typ] [varchar](50) NULL,
	[NazwaDO] [varchar](50) NULL,
	[CenaNettoDO] [decimal](10, 2) NULL,
	[VatDO] [int] NULL,
	[Rozmiar] [varchar](50) NULL,
	[Strona] [varchar](50) NULL,
	[RodzZamka] [varchar](50) NULL,
	[NazwaWy] [varchar](50) NULL,
	[CenaNettoWy] [decimal](10, 2) NULL,
	[VatWy] [int] NULL,
	[Ilosc] [int] NULL,
	[CenaBrutto] [decimal](10, 2) NULL,
	[DataZam] [date] NULL,
	[NrZamowienia] [int] NULL,
	[StatusZam] [varchar](50) NULL,
 CONSTRAINT [PK_Zamowienia2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AcceptZamowienie]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AcceptZamowienie]
(
@nrzamowienia int
)
as
UPDATE Zamowienia 
set StatusZam='rozpoczęte'
where NrZamowienia=@nrzamowienia and StatusZam='';
RETURN
GO
/****** Object:  StoredProcedure [dbo].[AddKatalog]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddKatalog]
@nazwa varchar(50),
@cenanetto decimal(10,2),
@vat int,
@typ varchar(50),
@obraz image
as
Insert into Katalog (Nazwa,CenaNetto,Vat,Typ,Obraz)
values(@nazwa,@cenanetto,@vat,@typ,@obraz);
GO
/****** Object:  StoredProcedure [dbo].[AddKlienci]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddKlienci]

@nazwa varchar(50),
@email varchar(50),
@nip varchar(50),
@telefon varchar(50),
@adresfakturyl1 varchar(50),
@adresfakturyl2 varchar(50),
@adreswysylkil1 varchar(50),
@adreswysylkil2 varchar(50),
@id_sklepu int

as

Insert into Klienci (Nazwa,Email,NIP,Telefon,AdresFakturyL1,AdresFakturyL2,AdresWysylkiL1,AdresWysylkiL2,Id_Sklepu)
values(@nazwa,@email,@nip,@telefon,@adresfakturyl1,@adresfakturyl2,@adreswysylkil1,@adreswysylkil2,@id_sklepu)
GO
/****** Object:  StoredProcedure [dbo].[AddSklepy]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddSklepy]
@nazwa varchar(50),
@adresl1 varchar(50),
@adresl2 varchar(50),
@nip varchar(50),
@email varchar(50),
@login varchar(50),
@haslo varchar(50),
@status varchar(50)
as
Insert into Sklepy (Nazwa,AdresL1,AdresL2,NIP,Email,Login,Haslo,Status)
values(@nazwa,@adresl1,@adresl2,@nip,@email,@login,@haslo,@status)
GO
/****** Object:  StoredProcedure [dbo].[AddUzytkownicy]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddUzytkownicy]
@imie varchar(50),
@nazwisko varchar(50),
@login varchar(6),
@haslo varchar(6),
@uckatalog bit,
@ucsklepy bit,
@ucrealizacjazam bit,
@ucwysylki bit,
@ucanalizy bit,
@uchistoriawys bit,
@ucrozliczeniaprod bit,
@ucuzytkownicy bit

as
Insert into Uzytkownicy(Imie,Nazwisko,Login,Haslo,UCKatalog,UCSklepy,UCRealizacjaZam,UCWysylki,UCAnalizy,UCHistoriaWys,UCRozliczeniaProd,UCUzytkownicy)
values(@imie,@nazwisko,@login,@haslo,@uckatalog,@ucsklepy,@ucrealizacjazam,@ucwysylki,@ucanalizy,@uchistoriawys,@ucrozliczeniaprod,@ucuzytkownicy)
GO
/****** Object:  StoredProcedure [dbo].[AddZamowienia]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddZamowienia]
@id_sklepu int,
@id_klienta int,
@nrzamowienia int,
@typ varchar(50),
@nazwa_do varchar(50),
@cenanetto_do decimal(10,2),
@vat_do int,
@rozmiar varchar(50),
@strona varchar(50),
@rodzzamka varchar(50),
@nazwa_wy varchar(50),
@cenanetto_wy decimal(10,2),
@vat_wy int,
@ilosc int,
@cenabrutto decimal(10,2),
@datazam date,
@statuszam varchar(50)
as
Insert into Zamowienia(Id_Sklepu,Id_Klienta,NrZamowienia,Typ,NazwaDO,CenaNettoDO,VatDO,Rozmiar,Strona,RodzZamka,NazwaWy,CenaNettoWy,VatWy,Ilosc,CenaBrutto,DataZam,StatusZam)
values(@id_sklepu,@id_klienta,@nrzamowienia,@typ,@nazwa_do,@cenanetto_do,@vat_do,@rozmiar,@strona,@rodzzamka,@nazwa_wy,@cenanetto_wy,@vat_wy,@ilosc,@cenabrutto,@datazam,@statuszam)
GO
/****** Object:  StoredProcedure [dbo].[AnaRankDrzwiBad]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AnaRankDrzwiBad]
@rok int
as
select top(10)
NazwaDO as Nazwa,
sum(Ilosc) as Ilość
from Zamowienia,Wysylki
where Typ='drzwi' and
Datepart(yyyy,Zamowienia.DataZam)=@rok and
Zamowienia.NrZamowienia=Wysylki.NrZamowienia
group by  NazwaDO
order by ilość asc
GO
/****** Object:  StoredProcedure [dbo].[AnaRankDrzwiBest]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AnaRankDrzwiBest]
@rok int
as
select top(10)
NazwaDO as Nazwa,
sum(Ilosc) as Ilość
from Zamowienia, Wysylki
where Typ='drzwi' and
Datepart(yyyy,Wysylki.DataWysylki)=@rok and
Zamowienia.NrZamowienia=Wysylki.NrZamowienia
group by  NazwaDO
order by ilość desc
GO
/****** Object:  StoredProcedure [dbo].[AnaRankSklep]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AnaRankSklep]
@rok int
as
select
--top(10)
Sklepy.Nazwa,
sum(Zamowienia.CenaBrutto) as Wartosc
from Sklepy,Zamowienia,Wysylki
where Sklepy.Id=Zamowienia.Id_Sklepu and
Zamowienia.NrZamowienia=Wysylki.NrZamowienia and
Datepart(yyyy,Wysylki.DataWysylki)=@rok
group by Sklepy.Nazwa
order by Wartosc desc
GO
/****** Object:  StoredProcedure [dbo].[AnaRankWyBad]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AnaRankWyBad]
@rok int
as
select top(10)
NazwaWy as Nazwa,
sum(Ilosc) as Ilość
from Zamowienia,Wysylki
where  Datepart(yyyy,Wysylki.DataWysylki)=@rok and
Zamowienia.NrZamowienia=Wysylki.NrZamowienia
group by  NazwaWy
order by ilość asc
GO
/****** Object:  StoredProcedure [dbo].[AnaRankWyBest]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AnaRankWyBest]
@rok int
as
select top(10)
NazwaWy as Nazwa,
sum(Ilosc) as Ilość
from Zamowienia,Wysylki
where  Datepart(yyyy,Wysylki.DataWysylki)=@rok and
Zamowienia.NrZamowienia=Wysylki.NrZamowienia
group by  NazwaWy
order by ilość desc
GO
/****** Object:  StoredProcedure [dbo].[AnaSprzMiesieczna]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AnaSprzMiesieczna]
@rok int
as
select 
datepart(MONTH,Wysylki.DataWysylki) as Miesiac,
sum(Zamowienia.CenaBrutto) as Sprzedaz
from Zamowienia,Wysylki
where
Zamowienia.NrZamowienia=Wysylki.NrZamowienia and
datepart(YEAR,Wysylki.DataWysylki)=@rok
group by datepart(MONTH,Wysylki.DataWysylki)
GO
/****** Object:  StoredProcedure [dbo].[DeleteKatalogById]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteKatalogById]
(
@id int
)
as
DELETE FROM Katalog where Id=@id;
GO
/****** Object:  StoredProcedure [dbo].[DeleteUzytkownicyById]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteUzytkownicyById]
@id int
as
delete from Uzytkownicy
where Id=@id
GO
/****** Object:  StoredProcedure [dbo].[DeleteZamById]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[DeleteZamById]
@idzamowienia int
as
delete from Zamowienia where Id=@idzamowienia;
GO
/****** Object:  StoredProcedure [dbo].[DeleteZamByNr]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[DeleteZamByNr]
@nrzamowienia int
as
delete from Zamowienia where NrZamowienia=@nrzamowienia and
(StatusZam='' or StatusZam='rozpoczęte');
GO
/****** Object:  StoredProcedure [dbo].[EmailSendUpdate]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[EmailSendUpdate] 
@nrzam int
as
UPDATE Wysylki 
set StatusEmail='wysłany'
where NrZamowienia=@nrzam
GO
/****** Object:  StoredProcedure [dbo].[EmailSendView]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[EmailSendView] 
@nrzam int
as
select
NrListu,
Spedytor,
DataWysylki
from Wysylki
where Wysylki.NrZamowienia=@nrzam
GO
/****** Object:  StoredProcedure [dbo].[GetKatalogById]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetKatalogById]
(
@id int
)
as
select * from Katalog where Id=@id;
GO
/****** Object:  StoredProcedure [dbo].[GetKatalogTypWyk]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetKatalogTypWyk]
as
select Nazwa,CenaNetto from Katalog where Typ='wykończenie';
GO
/****** Object:  StoredProcedure [dbo].[GetKlienciById]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetKlienciById]
(
@id int
)
as
select * from Klienci where Id=@id;
GO
/****** Object:  StoredProcedure [dbo].[HistGlobalViewDtp]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HistGlobalViewDtp]
@dataod date,
@datado date
as
select
Zamowienia.NrZamowienia,
sum(Zamowienia.CenaBrutto) as Wartosc,
Klienci.Nazwa as NazwaKlienta,
Sklepy.Nazwa as NazwaSklepu,
Wysylki.Spedytor,
Wysylki.NrListu,
Zamowienia.DataZam,
Wysylki.DataWysylki

from Zamowienia,Wysylki,Klienci,Sklepy
where DataWysylki between @dataod and @datado and
Zamowienia.Id_Klienta=Klienci.Id and
Zamowienia.NrZamowienia=Wysylki.NrZamowienia and
Sklepy.Id=Zamowienia.Id_Sklepu and
Zamowienia.StatusZam='zakończone'

group by Zamowienia.NrZamowienia,Spedytor,NrListu,DataZam,DataWysylki,Klienci.Nazwa,Sklepy.Nazwa
order by NrZamowienia desc
GO
/****** Object:  StoredProcedure [dbo].[HistGlobalViewNrZam]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HistGlobalViewNrZam]

@nrzamowienia int
as
select
Zamowienia.NrZamowienia,
sum(Zamowienia.CenaBrutto) as Wartosc,
Klienci.Nazwa as NazwaKlienta,
Sklepy.Nazwa as NazwaSklepu,
Wysylki.Spedytor,
Wysylki.NrListu,
Zamowienia.DataZam,
Wysylki.DataWysylki

from Zamowienia,Wysylki,Klienci,Sklepy
where Zamowienia.NrZamowienia=@nrzamowienia and
Zamowienia.Id_Klienta=Klienci.Id and Zamowienia.NrZamowienia=Wysylki.NrZamowienia and Sklepy.Id=Zamowienia.Id_Sklepu and Zamowienia.StatusZam='zakończone'

group by Zamowienia.NrZamowienia,Spedytor,NrListu,DataZam,DataWysylki,Klienci.Nazwa,Sklepy.Nazwa
--order by NrZamowienia desc
GO
/****** Object:  StoredProcedure [dbo].[HistGlobalViewTop]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HistGlobalViewTop]
@topzam int
as
select top(@topzam)
Zamowienia.NrZamowienia,
sum(Zamowienia.CenaBrutto) as Wartosc,
Klienci.Nazwa as NazwaKlienta,
Sklepy.Nazwa as NazwaSklepu,
Wysylki.Spedytor,
Wysylki.NrListu,
Zamowienia.DataZam,
Wysylki.DataWysylki

from Zamowienia,Wysylki,Klienci,Sklepy
where Zamowienia.Id_Klienta=Klienci.Id and Zamowienia.NrZamowienia=Wysylki.NrZamowienia and Sklepy.Id=Zamowienia.Id_Sklepu and Zamowienia.StatusZam='zakończone'
group by Zamowienia.NrZamowienia,Spedytor,NrListu,DataZam,DataWysylki,Klienci.Nazwa,Sklepy.Nazwa
order by NrZamowienia desc
GO
/****** Object:  StoredProcedure [dbo].[HistoriaView]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HistoriaView] as
select
Zamowienia.NrZamowienia,
sum(Zamowienia.CenaBrutto) as Wartosc,
Wysylki.Spedytor,
Wysylki.NrListu,
Zamowienia.DataZam,
Wysylki.DataWysylki,
Klienci.Nazwa as NazwaKlienta,
Sklepy.Nazwa as NazwaSklepu

from Zamowienia,Wysylki,Klienci,Sklepy
where Zamowienia.Id_Klienta=Klienci.Id and
Zamowienia.NrZamowienia=Wysylki.NrZamowienia and
Sklepy.Id=Zamowienia.Id_Sklepu and
Zamowienia.StatusZam='zakończone'
group by Zamowienia.NrZamowienia,Spedytor,NrListu,DataZam,DataWysylki,Klienci.Nazwa,Sklepy.Nazwa
GO
/****** Object:  StoredProcedure [dbo].[HistSklepViewDtp]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HistSklepViewDtp]
@dataod date,
@datado date,
@idsklepu int
as
select
Zamowienia.NrZamowienia,
sum(Zamowienia.CenaBrutto) as Wartosc,
Klienci.Nazwa as NazwaKlienta,
Wysylki.Spedytor,
Wysylki.NrListu,
Zamowienia.DataZam,
Wysylki.DataWysylki

from Zamowienia,Wysylki,Klienci,Sklepy
where DataWysylki between @dataod and @datado and
Zamowienia.Id_Klienta=Klienci.Id 
and Zamowienia.NrZamowienia=Wysylki.NrZamowienia 
and Sklepy.Id=Zamowienia.Id_Sklepu 
and Zamowienia.StatusZam='zakończone'
and Zamowienia.Id_Sklepu=@idsklepu

group by Zamowienia.NrZamowienia,Spedytor,NrListu,DataZam,DataWysylki,Klienci.Nazwa,Sklepy.Nazwa
order by NrZamowienia desc
GO
/****** Object:  StoredProcedure [dbo].[HistSklepViewNrZam]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HistSklepViewNrZam]

@nrzamowienia int,
@idsklepu int
as
select
Zamowienia.NrZamowienia,
sum(Zamowienia.CenaBrutto) as Wartosc,
Klienci.Nazwa as NazwaKlienta,
--Sklepy.Nazwa as NazwaSklepu,
Wysylki.Spedytor,
Wysylki.NrListu,
Zamowienia.DataZam,
Wysylki.DataWysylki

from Zamowienia,Wysylki,Klienci,Sklepy
where Zamowienia.NrZamowienia=@nrzamowienia 
and Zamowienia.Id_Klienta=Klienci.Id 
and Zamowienia.NrZamowienia=Wysylki.NrZamowienia 
and Sklepy.Id=Zamowienia.Id_Sklepu 
and Zamowienia.StatusZam='zakończone'
and Zamowienia.Id_Sklepu=@idsklepu

group by Zamowienia.NrZamowienia,Spedytor,NrListu,DataZam,DataWysylki,Klienci.Nazwa,Sklepy.Nazwa
--order by NrZamowienia desc
GO
/****** Object:  StoredProcedure [dbo].[HistSklepViewTop]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HistSklepViewTop]
@topzam int,
@idsklepu int
as
select top(@topzam)
Zamowienia.NrZamowienia,
sum(Zamowienia.CenaBrutto) as Wartosc,
Klienci.Nazwa as NazwaKlienta,
--Sklepy.Nazwa as NazwaSklepu,
Wysylki.Spedytor,
Wysylki.NrListu,
Zamowienia.DataZam,
Wysylki.DataWysylki

from Zamowienia,Wysylki,Klienci,Sklepy
where Zamowienia.Id_Klienta=Klienci.Id 
and Zamowienia.NrZamowienia=Wysylki.NrZamowienia 
and Sklepy.Id=Zamowienia.Id_Sklepu 
and Zamowienia.StatusZam='zakończone'
and Zamowienia.Id_Sklepu=@idsklepu
group by Zamowienia.NrZamowienia,Spedytor,NrListu,DataZam,DataWysylki,Klienci.Nazwa,Sklepy.Nazwa
order by NrZamowienia desc
GO
/****** Object:  StoredProcedure [dbo].[KatalogView]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[KatalogView] as
select * from dbo.Katalog order by Nazwa
GO
/****** Object:  StoredProcedure [dbo].[KlienciView]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[KlienciView]
@id_sklepu int
as
select * from Klienci 
where Id_Sklepu=@id_sklepu 
order by Nazwa
GO
/****** Object:  StoredProcedure [dbo].[LoginInfoProd]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[LoginInfoProd]
@login varchar(6),
@haslo varchar(6)
as
select CONCAT('Zalogowany jako użytkownik: ',Imie,' ',Nazwisko) as zalogowanyjako,Id 
from Uzytkownicy
where Login=@login and Haslo=@haslo;
GO
/****** Object:  StoredProcedure [dbo].[LoginInfoSklep]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[LoginInfoSklep]
@login varchar(50),
@haslo varchar(50)
as
select CONCAT('Zalogowany jako Sklep: ',Nazwa,', ',AdresL1,', ',AdresL2) as zalogowanyjako,Id 
from Sklepy
where Login=@login and Haslo=@haslo;
GO
/****** Object:  StoredProcedure [dbo].[LoginToProd]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[LoginToProd]
@login varchar(6),
@haslo varchar(6)
as
select count(*) as logowanieProd 
from Uzytkownicy 
where Login=@login and Haslo=@haslo
GO
/****** Object:  StoredProcedure [dbo].[LoginToSklepy]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[LoginToSklepy]
@login varchar(50),
@haslo varchar(50)
as
select count(*) as logowanie 
from Sklepy 
where Login=@login and Haslo=@haslo and
Status='aktywny';
GO
/****** Object:  StoredProcedure [dbo].[ManageZam]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[ManageZam]
@idsklepu int
as
select
NrZamowienia, 
Klienci.Nazwa as [Nazwa Klienta],
StatusZam as Status,
DataZam as Data,
sum(CenaBrutto) as [Wartosc]
from Zamowienia, Klienci,Sklepy
where Zamowienia.Id_Klienta=Klienci.Id and
(StatusZam='' or StatusZam='rozpoczęte') and
Klienci.Id_Sklepu=Sklepy.Id and
Sklepy.Id=@idsklepu
group by NrZamowienia,StatusZam,DataZam,Klienci.Nazwa
order by NrZamowienia desc


GO
/****** Object:  StoredProcedure [dbo].[MaxZamowienia]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[MaxZamowienia]

as
select max(NrZamowienia)+1 as nrzamowienia 
from Zamowienia;
GO
/****** Object:  StoredProcedure [dbo].[RealizacjaSklep]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[RealizacjaSklep]
@idsklepu int
as
select
NrZamowienia, 
Klienci.Nazwa as [Nazwa Klienta],
StatusZam as Status,
DataZam as Data,
sum(CenaBrutto) as [Wartosc]

from Zamowienia, Klienci
where Zamowienia.Id_Klienta=Klienci.Id and
StatusZam='w realizacji' and
Zamowienia.Id_Sklepu=@idsklepu
group by NrZamowienia,StatusZam,DataZam,Klienci.Nazwa
order by NrZamowienia desc
GO
/****** Object:  StoredProcedure [dbo].[RealizacjaView]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[RealizacjaView] as
select
NrZamowienia, 
Sklepy.Nazwa as [Nazwa Sklepu],
StatusZam as Status,
DataZam as Data,
sum(CenaBrutto) as [Wartosc]
from Zamowienia, Sklepy
where Sklepy.Id=Zamowienia.Id_Sklepu and
(StatusZam='rozpoczęte' or StatusZam='w realizacji')
group by NrZamowienia,StatusZam,DataZam, Sklepy.Nazwa
order by NrZamowienia desc
GO
/****** Object:  StoredProcedure [dbo].[RealizujZamowienie]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[RealizujZamowienie]
(
@nrzamowienia int
)
as
UPDATE Zamowienia 
set StatusZam='w realizacji'
where NrZamowienia=@nrzamowienia and StatusZam='rozpoczęte';
RETURN
GO
/****** Object:  StoredProcedure [dbo].[RozliczeniaProd]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[RozliczeniaProd]
@rok int,
@miesiac int
as
select
Sklepy.Nazwa as NazwaSklepu,
sum(Zamowienia.CenaBrutto) as WartoscSprzedazy
from Sklepy,Zamowienia,Wysylki
where Sklepy.Id=Zamowienia.Id_Sklepu and
Zamowienia.NrZamowienia=Wysylki.NrZamowienia and
datepart(yyyy,Wysylki.DataWysylki)=@rok and
datepart(mm,Wysylki.DataWysylki)=@miesiac
group by Sklepy.Nazwa
order by Nazwa
GO
/****** Object:  StoredProcedure [dbo].[RozliczeniaSklepu]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[RozliczeniaSklepu]
@idsklepu int,
@miesiac int,
@rok int
as
select
Zamowienia.NrZamowienia,
Klienci.Nazwa as NazwaKlienta,
sum(Zamowienia.CenaBrutto) as Wartosc,
Wysylki.DataWysylki

from Zamowienia,Klienci,Wysylki
where Zamowienia.Id_Klienta=Klienci.Id and
Zamowienia.Id_Sklepu=@idsklepu and
Wysylki.NrZamowienia=Zamowienia.NrZamowienia and
datepart(MONTH,Wysylki.DataWysylki)=@miesiac and datepart(YEAR,Wysylki.DataWysylki)=@rok
group by Zamowienia.NrZamowienia, Nazwa,DataZam, Wysylki.DataWysylki
order by Wysylki.DataWysylki desc;


GO
/****** Object:  StoredProcedure [dbo].[RozliczeniaSklepuSuma]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[RozliczeniaSklepuSuma]
@idsklepu int,
@miesiac int,
@rok int
as
select sum(Zamowienia.CenaBrutto) as sumamiesieczna
from Zamowienia,Wysylki
where Zamowienia.Id_Sklepu=@idsklepu and
Zamowienia.NrZamowienia=Wysylki.NrZamowienia and
datepart(MONTH,Wysylki.DataWysylki)=@miesiac and datepart(YEAR,Wysylki.DataWysylki)=@rok
GO
/****** Object:  StoredProcedure [dbo].[ShowImageKatalogById]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ShowImageKatalogById]
(
@id int
)
as
Select Nazwa, Obraz 
FROM Katalog 
where Id=@id;
GO
/****** Object:  StoredProcedure [dbo].[SklepyPause]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SklepyPause]
@id int
as
Update Sklepy
set Status='nieaktywny' 
where Id=@id
GO
/****** Object:  StoredProcedure [dbo].[SklepyPlay]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SklepyPlay]
@id int
as
Update Sklepy
set Status='aktywny' 
where Id=@id
GO
/****** Object:  StoredProcedure [dbo].[SklepyView]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SklepyView] 
as
Select * 
from Sklepy 
order by Nazwa
GO
/****** Object:  StoredProcedure [dbo].[UpdateKatalog]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateKatalog]
(
@id int,
@nazwa varchar(50),
@cenanetto varchar(50),
@vat int,
@typ varchar(50),

@obraz image
)
as
UPDATE Katalog 
set Nazwa=@nazwa,CenaNetto=@cenanetto, Vat=@vat, Typ=@typ,  Obraz=@obraz
where Id=@id;
RETURN
GO
/****** Object:  StoredProcedure [dbo].[UpdateKlienci]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateKlienci]
(
@id int,
@nazwa varchar(50),
@email varchar(50),
@nip varchar(50),
@telefon varchar(50),
@adresfakturyl1 varchar(50),
@adresfakturyl2 varchar(50),
@adreswysylkil1 varchar(50),
@adreswysylkil2 varchar(50)
)
as
UPDATE Klienci 
set Nazwa=@nazwa,Email=@email, NIP=@nip, Telefon=@telefon, AdresFakturyL1=@adresfakturyl1,
AdresFakturyL2=@adresfakturyl2, AdresWysylkiL1=@adreswysylkil1,AdresWysylkiL2=@adreswysylkil2

where Id=@id;
RETURN
GO
/****** Object:  StoredProcedure [dbo].[UpdateUzytkownicy]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UpdateUzytkownicy]
@id int,
@imie varchar(50),
@nazwisko varchar(50),
@login varchar(6),
@haslo varchar(6),
@uckatalog bit,
@ucsklepy bit,
@ucrealizacjazam bit,
@ucwysylki bit,
@ucanalizy bit,
@uchistoriawys bit,
@ucrozliczeniaprod bit,
@ucuzytkownicy bit

as
Update Uzytkownicy set
Imie=@imie,
Nazwisko=@nazwisko,
Login=@login,
Haslo=@haslo,
UCKatalog=@uckatalog,
UCSklepy=@ucsklepy,
UCRealizacjaZam=@ucrealizacjazam,
UCWysylki=@ucwysylki,
UCAnalizy=@ucanalizy,
UCHistoriaWys=@uchistoriawys,
UCRozliczeniaProd=@ucrozliczeniaprod,
UCUzytkownicy=@ucuzytkownicy
where Id=@id;
GO
/****** Object:  StoredProcedure [dbo].[UpdateWysylki]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateWysylki]
(
@nrzamowienia int,
@nrlistu varchar (50),
@spedytor varchar (50),
@datawysylki datetime,
@statusemail varchar(50)
)
as
UPDATE Zamowienia 
set StatusZam='zakończone'
where NrZamowienia=@nrzamowienia and StatusZam='w realizacji';
Insert into Wysylki(NrZamowienia,NrListu,Spedytor,DataWysylki,StatusEmail)
values(@nrzamowienia, @nrlistu, @spedytor,@datawysylki,@statusemail)

RETURN
GO
/****** Object:  StoredProcedure [dbo].[UprawnieniaProd]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UprawnieniaProd]
@id int
as
select
UCKatalog,
UCSklepy,
UCRealizacjaZam,
UCWysylki,
UCAnalizy,
UCHistoriaWys,
UCRozliczeniaProd,
UCUzytkownicy
from Uzytkownicy
where Id=@id
GO
/****** Object:  StoredProcedure [dbo].[UtwZamDzwOscDodaj]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
procedure [dbo].[UtwZamDzwOscDodaj] 
as
select * 
from dbo.Katalog 
where Typ!='wykończenie' 
order by Nazwa;
GO
/****** Object:  StoredProcedure [dbo].[UtwZamWykonDodaj]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
procedure [dbo].[UtwZamWykonDodaj] 
as
select * 
from dbo.Katalog 
where Typ='wykończenie' 
order by Nazwa;
GO
/****** Object:  StoredProcedure [dbo].[UzytkownicyView]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UzytkownicyView]
as
select*
from Uzytkownicy
order by Nazwisko, Imie
GO
/****** Object:  StoredProcedure [dbo].[UzytkownicyViewById]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UzytkownicyViewById]
@id int
as
select
Imie,Nazwisko,Login,Haslo,
UCKatalog,
UCSklepy,
UCRealizacjaZam,
UCWysylki,
UCAnalizy,
UCHistoriaWys,
UCRozliczeniaProd,
UCUzytkownicy
from Uzytkownicy
where Id=@id
GO
/****** Object:  StoredProcedure [dbo].[WiadomosciEmail]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[WiadomosciEmail]
@idsklepu int,
@today date
as
select
Zamowienia.NrZamowienia, 
Klienci.Nazwa as [Nazwa Klienta],
Klienci.Email,
sum(CenaBrutto) as [Wartosc],
DataZam as DataZam,
Wysylki.DataWysylki
--Wysylki.StatusEmail
from Zamowienia, Klienci, Wysylki
where Zamowienia.Id_Klienta=Klienci.Id and 
StatusZam='zakończone' and
Wysylki.NrZamowienia=Zamowienia.NrZamowienia and
Zamowienia.Id_Sklepu=@idsklepu and
StatusEmail!='wysłany'and
Wysylki.DataWysylki=@today
group by 
Zamowienia.NrZamowienia,
Klienci.Nazwa,
Klienci.Email,
DataZam,
Wysylki.DataWysylki,
Wysylki.StatusEmail
order by NrZamowienia desc
GO
/****** Object:  StoredProcedure [dbo].[WysylkiView]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[WysylkiView] 
as
select
NrZamowienia, 
Klienci.Nazwa as [NazwaKlienta],
Klienci.AdresWysylkiL1,
Klienci.AdresWysylkiL2,
Klienci.Telefon,
DataZam as Data
from Zamowienia, Klienci
where Zamowienia.Id_Klienta=Klienci.Id and StatusZam='w realizacji'
group by NrZamowienia,Klienci.Nazwa,Klienci.AdresWysylkiL1,Klienci.AdresWysylkiL2,DataZam,Klienci.Telefon
order by NrZamowienia desc
GO
/****** Object:  StoredProcedure [dbo].[ZamowieniaViewByNrZam]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ZamowieniaViewByNrZam]
@nrzamowienia int
as
select
Id,
Typ,
NazwaDO as Nazwa,
CenaNettoDO as [Cena Netto],
VatDO as Vat,
Rozmiar,
Strona,
RodzZamka as Zamek,
NazwaWy as [Nazwa Wyk.],
CenaNettoWy as [Cena Netto Wyk.],
VatWy as [Vat Wyk.],
Ilosc as Ilość,
CenaBrutto as [Cena Brutto] 
FROM Zamowienia 
where NrZamowienia=@nrzamowienia;
GO
/****** Object:  StoredProcedure [dbo].[ZamViewByNrZam]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ZamViewByNrZam]
@nrzamowienia int
as
select
Typ,
NazwaDO as Nazwa,
Rozmiar,
Strona,
RodzZamka as Zamek,
NazwaWy as [Nazwa Wyk.],
Ilosc as Ilość,
CenaBrutto as [Cena Brutto] 
FROM [dbDoors].[dbo].[Zamowienia]
where NrZamowienia=@nrzamowienia;
GO
/****** Object:  StoredProcedure [dbo].[ZamViewNabywcaByNrZam]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ZamViewNabywcaByNrZam]
@nrzamowienia int
as
select 
Klienci.Nazwa,
Klienci.AdresWysylkiL1,
Klienci.AdresWysylkiL2,
Klienci.NIP
from Klienci,Zamowienia
where Zamowienia.Id_Klienta=Klienci.Id and Zamowienia.NrZamowienia=@nrzamowienia
group by Klienci.Nazwa,Klienci.AdresWysylkiL1,Klienci.AdresWysylkiL2,Klienci.NIP
GO
/****** Object:  StoredProcedure [dbo].[ZamViewSklepByNrZam]    Script Date: 14.12.2020 01:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ZamViewSklepByNrZam]
@nrzamowienia int
as
select 
Sklepy.Nazwa,
Sklepy.AdresL1,
Sklepy.AdresL2,
Sklepy.NIP
from Sklepy,Zamowienia
where Zamowienia.Id_Sklepu=Sklepy.Id and Zamowienia.NrZamowienia=@nrzamowienia
group by Sklepy.Nazwa, Sklepy.AdresL1,Sklepy.AdresL2,Sklepy.NIP
GO
