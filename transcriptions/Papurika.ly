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
  fis2:m cis:m7 d4 e a2 d e cis:7 fis:m \break
  fis2:m cis:m7 d4 e a2 d2 cis:7 fis1 \break
  b2 cis cis dis:m b fis ais:7 dis:m \break
  b2 cis cis fis dis gis:7 b4 cis4 fis2
  r1
  a2 e fis:m e d e a1
  
 }

% Bass
bass_intro = \relative {
  \key a \major
  r1 r1 r1 
  r2 r8 fis,16 g\2 gis\2 e8.\3
}
bass_verse = \relative {
  a,,8\4 e'\3 \slashedGrace { a\2\glissando } b\2 a\2 gis\2 e\3 r16 e\3 gis8\2 |
  fis8\3 fis\3 r16 fis8.\3 e8\3 r r16 b\4 e8\3 |
  d8\3 d\3 \slashedGrace { e\3\glissando } fis\3 b,\4 e\3 r8 r16 b\4 e\3 r |
  a,8\4 e'\3 \slashedGrace { a\2\glissando } b\2 e,\3 a,4\4 r4 | 
}
bass_second_verse = \relative {
  a,,8\4 e'\3 \slashedGrace { a\2\glissando } b\2 a\2 gis4\2 r16 e\3 gis8\2 |
  fis8\3 fis\3 gis\2 a\2 e4\3 r16 b\4 e8\3 |
  d8\3 d\3 r8\3 e16\3 fis16\3 e4.\3 b'16\2 e,\3
  a8\2 a\2 r8 e8\3  e16\3 a16\2 e16\3 a,4\4 e'8\3
}
bass_bridge = \relative {
  fis,8 fis r16 b,16 c8 cis8 cis' \deadNote cis,16 cis \deadNote cis \deadNote cis
  d8\3 d\3 r16 e8.\3 a,8\4 a'\2 r16 e\3 dis8\3 | 
  d8\3 d\3 r16 d8.\3 e4\3 d\3 |
  cis8\3 cis\3 r16 e16\2 f8\2 fis16\2 cis\3 fis,8\4 r16 fis'8.\2 |
  fis,8 fis a b cis r8 e4\3 |
  d8\3 d\3 e\3 e\3 a,\4 a'\2 r16 e16\3 dis8\3 |
  d8\3 d\3 r16 a16\4 d8\3 cis8 cis r16 e16 f8 |
  fis8 fis r16 cis16 fis8 fis,4 r4 | 
}
bass_chorus = \relative c, {
  b8\3 b'8\1 r16 b,16\3 c8\3 cis\3 cis\1 r8 \deadNote cis8\3 |
  cis8\3 cis'\1 r16 cis,16\3 d8\3 dis\3 dis'\1 cis,8\3 cis'\1 |
  b,8\3 b'8\1 r16 b,16\3 cis8\3 fis,\4 fis'\2 r16 fis,16 r8 |
  ais8\4 ais\4 r16 cis16 ais8\4 dis\3 dis\3 cis\3 cis\3 | \break
  b8\3 b'\1 r16 b,16\3 c8\3 cis\3 cis'\1 r8 \deadNote cis,8\3 |
  cis8 cis r16 cis'16 cis,8 fis fis f f |
  dis8\3 dis\3 r16 fis16 g8\2 gis16\2 dis\3 gis,8\4( gis8\4) r16 \deadNote gis16\4 |
  b8 b' cis, cis'\1 fis,, r8 fis4
  
}
bass_line = {
  \bass_intro
  \bass_verse
  \bass_bridge \break
  \bass_chorus %\break
  r1 \break
  \bass_second_verse
}

  
bassstaff = \new Staff \with {
  instrumentName = "Bass" %shortInstrumentName = "Bs"
} 
    <<
      \tempo "Allegretto" 4 = 101
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

\score {
  \unfoldRepeats {
    \bassstaff
  }
  \midi { }
}

