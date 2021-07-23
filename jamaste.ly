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

verse = \relative c' {
  \clef treble
  \key g \major
  \time 4/4
  < d e' a >1 < d c' g' > < fis d' fis > < g c d g > 
}

{ \verse }