\version "2.18.2"

\header {
  title = "As-Yet Unnamed Tune in D"
  subtitle = "With lots of 9s"
  composer = "Ivan Gayton"
  tagline = \markup {
    \column {
      "Unnamed Song by Ivan Gayton,"
      "Mishima Mura Iojima, Kagoshima, Japan 2021"
    }
  }
}

fingerchords = {
  < d e'\3 a\2 >1 < d c'\3 g'\2 > < fis d'\3 fis > < g c d g >
}
guitstaff = \new Staff {
  \clef "treble_8"
  \key g \major
  \time 4/4
  \omit Voice.StringNumber
  \relative c {
    \fingerchords
  }
}
tabstaff = \new TabStaff \relative c {
   \fingerchords
}

\score {
  <<
    \new StaffGroup <<
      \guitstaff
      \tabstaff
    >>
  >>
}
