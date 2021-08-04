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

compchords = \new ChordNames \chordmode {
  %\set chordChanges = ##t % if no change, don't show
  a2 gis:m fis:m e d e a1 \break
  a2 gis:m fis:m e d e a1 \break
}

% Bass
bass_intro = \relative {
  r1 r1 r1 
  r2 r8 fis,16 g\2 gis\2 e8.\3
}
bass_verse = \relative {
  a,,8\4 e'\3 \slashedGrace { a\2\glissando } b\2 a\2 gis\2 e\3 r16 e\3 gis8\2 |
  fis8\3 fis\3 r16 fis8.\3 e8\3 r r16 b\4 e8\3 |
  d8\3 d\3 \slashedGrace { e\3\glissando } fis\3 b,\4 e\3 r8 r16 b\4 e\3 r |
  a,8\4 e'\3 \slashedGrace { a\2\glissando } b\2 e,\3 a,4\4 r4 | 
}
bass_line = {
  \bass_intro
  \bass_verse
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

