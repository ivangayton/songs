\version "2.18.2"

\header {
  title = "Papurika"
  subtitle = "(パプリカ)"
  composer = "Kenshi Yonezu"
  tagline = \markup {
    \column {
      "Papurika by Kenshi Yonezu"
      "Transcribed by Ivan Gayton for Mishima Band,"
      "Mishima Mura Iojima, Kagoshima, Japan 2021"
    }
  }
}

compchords = \new ChordNames {
  \set chordChanges = ##t % if no change, don't show
  r1 a2 gis fis e
}

% Bass
bass_line = \relative {
  r2 r8 fis,16 g\2 gis\2 e8.\3
  a,8\4 e'\3 \slashedGrace { a\2\glissando } b\2 a\2 gis\2 e\3 r16 e\3 gis8\2
}
  
bassstaff = \new Staff \with {
  instrumentName = "Bass" shortInstrumentName = "Bs"
} 
    <<
      \new Voice {
        \omit Voice.StringNumber
        \clef "bass_8"
          \bass_line 
      }
    >>

basstabstaff = \new TabStaff \with {
  stringTunings = #bass-tuning
}{
  %\bar ".|:"
  \bass_line
}

% SCORES (separate for layout and midi for repeats)
\score {
  <<
    \compchords 
    \bassstaff
    \basstabstaff
  >>
  \layout { 
    \context { \Staff \RemoveEmptyStaves }
    \override Score.TimeSignature.
    break-visibility = #all-invisible
  }
}

