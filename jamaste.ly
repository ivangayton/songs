\version "2.18.2"

\header {
  title = "As-Yet Unnamed Tune in D Myxolydian"
  subtitle = "With lots of 9s"
  composer = "Mishima Band"
  tagline = \markup {
    \column {
      "Unnamed Song by Ivan Gayton,"
      "Mishima Mura Iojima, Kagoshima, Japan 2021"
    }
  }
}

fingerchords = {
  \time 4/4
  < d e'\3 a\2 >1 < d c'\3 g'\2 > < fis d'\3 fis > < g c d g >
}

timedchords = {
  \time 4/4
  < d e'\3 a\2 >4. < d c'\3 g'\2 >8 < fis d'\3 fis > < g c d g >4.
}

turnaround = {
  \time 2/4
  < d e'\3 a\2 >4. < d c'\3 g'\2 >8 
  \time 4/4 
  < fis d'\3 fis >1  < d c'\3 g'\2 > 
}


guitstaff = \new Staff {
  \clef "treble_8"
  \key g \major
  \time 4/4
  \omit Voice.StringNumber
  \relative c {
    \repeat percent 4 \fingerchords
    \break
    \repeat percent 3 \timedchords
    \turnaround
  }
}
tabstaff = \new TabStaff \relative c {
   \repeat percent 4 \fingerchords
   \repeat percent 3 \timedchords
   \turnaround
}

\score {
  <<
    \new StaffGroup <<
      \guitstaff
      \tabstaff
    >>
  >>
  \layout { 
    \context { \Staff \RemoveEmptyStaves }
    %\override Score.TimeSignature.
    %break-visibility = #all-invisible
  }
}


