\version "2.18.2"

\header {
  title = "Devil Siren"
  subtitle = "(Trouble is on the way)"
  composer = "Mishima Band"
  tagline = \markup {
    \column {
      "Devil Siren by Ivan Gayton for Mishima Band,"
      "Mishima Mura Iojima, Kagoshima, Japan 2021"
    }
  }
}

% VOICE
vocal_melody = \relative c' {
  \clef treble
  \key a \minor
  \time 4/4
  f'2 e8 r r e| d( e) f e4 c a8( | a)  a a r g( a) r a
  c8( b) g c r b a( g) | a2 r |
  c8( b) g c r b a( g) | a2 r |
  r1 |
}
text = \lyricmode {
  I know that trouble is on the way 
  you're not ready but
  ready or not you're gonna ride
  ready or not you're gonna ride
}
voxstaff = \new Staff \with {
  instrumentName = "Vocal" shortInstrumentName = "Vx"
} <<
  \set Staff.explicitClefVisibility = #'#(#f #t #t)
  \new Voice = "vox" { \autoBeamOff R1*4
                       \repeat volta 2 {
                         \vocal_melody 
                       }
                       \break }
  \new Lyrics \lyricsto "vox" { \text }
>>

% Guitar
line = {
  a8 \tuplet 3/1 { a d e } g a c a g a
  a,8 \tuplet 3/1 { a d e } g a c a c,4
  a8 \tuplet 3/1 { a d e } g a c a g,16 g gis8
  a d8( e) g a16 a c8 a4 
}
guitar_line = \relative c {
  \key a \minor
  \time 4/4
  \line
}
funkstrum = {
  < a c e a >16 r r < a c e a > r r < a c e a > r r 
  < a c e a > r r < a c e a > r < g c > < a c >
}
funkclimb = {
  < e b' d g >4 < e b' d g >8 
  \deadNotesOn < e b' d g >16 < e b' d g > 
  < e b' d g > < e b' d g > \deadNotesOff  
  < f c' e a >8 < f c' e a > r
}
guitar_rythm = \relative c' {
  \repeat percent 4 \funkstrum \noBreak
  \break
  \repeat percent 3 \funkclimb 
  < g d' f b >8 r < g d' f b > r 
  < g d' f b > r < g d' f b > r
}
bridge = \relative {
  \repeat percent 2 { 
    < e b' e >8 < e b' e > r4
    < g d' g >8 < g d' g > r4
    < d a' d >8 < d a' d > r4
    < f c' f >8 < f c' f > r4
  }
}
guitstaff = \new Staff \with {
  instrumentName = "Guit" shortInstrumentName = "Gt"
  } <<
    \tempo "Allegro" 4 = 115
    \new Voice = "guit" { 
      \clef "treble_8"
      \autoBeamOn 
      \repeat volta 2 {
        \bar ".|:"
        \guitar_line 
      }
      \break 
      \guitar_rythm
      \repeat volta 2 {
        \guitar_line 
      }
      \break
      \bridge
    }
  >>
intro_chords = \chordmode {
  a1:m a:m a:m a:m
}
guitar_comp = \chordmode {
  a1:m a:m a:m a:m e2:m7 f:7+ e:m7 f:7+ e:m f:7+ g1:7
}
guitchords = \new ChordNames {
  \set chordChanges = ##t % if no change, don't show
  { \intro_chords \guitar_comp }
}
guittabstaff = \new TabStaff \with {
  stringTunings = #guitar-tuning
}{
  \repeat volta 2 {
    \bar ".|:"
    \guitar_line 
  }
  \break 
  \guitar_rythm 
  \repeat volta 2 {
    \guitar_line 
  }
  \break
  \bridge
}

% Bass
aslap = {
  a,8 a'16 a, g' a a, a c' a, a a' a, a g' a
}
eslap = \relative c {
  e,8 e, e'' e,,16 e'' e, f f f'8 f16 f, f'
}
bass_intro = \relative c, {
  \key a \minor
  \time 4/4
  \line
}
bass_line = \relative c {
  \key a \minor
  \time 4/4
  \repeat percent 4 \aslap 
  \repeat percent 3 \eslap 
  g8 g g' g, r g, g' g,
  \repeat percent 4 \aslap
  \repeat percent 2 {
    e8 e r4 g8 g r4 d8 d r4 f8 f r4
  }
  
}
bassstaff = \new Staff \with {
      instrumentName = "Bass" shortInstrumentName = "Bs"
    } <<
      \new Voice = "bass" { 
        \clef "bass_8"
        \autoBeamOn 
        \bass_intro 
        \bass_line }
    >>
basstabstaff = \new TabStaff \with {
  stringTunings = #bass-tuning
}{
  %\bar ".|:"
  \bass_intro
  \bass_line
}

% SCORES (separate for layout and midi for repeats)
\score {
  <<
    \guitchords 
    \voxstaff
    \guitstaff
    \guittabstaff
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
    \voxstaff
    \guitstaff
    \bassstaff
  }
  \midi { }
}
