local colors = {
  canvasDefaultTransparent = "rgba(255,255,255,0)",
  pageHeaderBg = "#f6f8fa",
  marketingIcon = {
    primary = "#218bff",
    secondary = "#54aeff"
  },
  diffBlob = {
    addition = {
      numText = "#24292f",
      fg = "#24292f",
      numBg = "#ccffd8",
      lineBg = "#e6ffec",
      wordBg = "#abf2bc"
    },
    deletion = {
      numText = "#24292f",
      fg = "#24292f",
      numBg = "#ffd7d5",
      lineBg = "#ffebe9",
      wordBg = "rgba(255,129,130,0.4)"
    },
    hunk = {
      numBg = "rgba(84,174,255,0.4)"
    },
    expander = {
      icon = "#57606a"
    },
    selectedLineHighlightMixBlendMode = "multiply"
  },
  diffstat = {
    deletionBorder = "rgba(27,31,36,0.15)",
    additionBorder = "rgba(27,31,36,0.15)",
    additionBg = "#2da44e"
  },
  searchKeyword = {
    hl = "#fff8c5"
  },
  prettylights = {
    syntax = {
      comment = "#6e7781",
      constant = "#0550ae",
      entity = "#8250df",
      storageModifierImport = "#24292f",
      entityTag = "#116329",
      keyword = "#cf222e",
      string = "#0a3069",
      variable = "#953800",
      brackethighlighterUnmatched = "#82071e",
      invalidIllegalText = "#f6f8fa",
      invalidIllegalBg = "#82071e",
      carriageReturnText = "#f6f8fa",
      carriageReturnBg = "#cf222e",
      stringRegexp = "#116329",
      markupList = "#3b2300",
      markupHeading = "#0550ae",
      markupItalic = "#24292f",
      markupBold = "#24292f",
      markupDeletedText = "#82071e",
      markupDeletedBg = "#ffebe9",
      markupInsertedText = "#116329",
      markupInsertedBg = "#dafbe1",
      markupChangedText = "#953800",
      markupChangedBg = "#ffd8b5",
      markupIgnoredText = "#eaeef2",
      markupIgnoredBg = "#0550ae",
      metaDiffRange = "#8250df",
      brackethighlighterAngle = "#57606a",
      sublimelinterGutterMark = "#8c959f",
      constantOtherReferenceLink = "#0a3069"
    }
  },
  codemirror = {
    text = "#24292f",
    bg = "#ffffff",
    guttersBg = "#ffffff",
    guttermarkerText = "#ffffff",
    guttermarkerSubtleText = "#6e7781",
    linenumberText = "#57606a",
    cursor = "#24292f",
    selectionBg = "rgba(84,174,255,0.4)",
    activelineBg = "rgba(234,238,242,0.5)",
    matchingbracketText = "#24292f",
    linesBg = "#ffffff",
    syntax = {
      comment = "#24292f",
      constant = "#0550ae",
      entity = "#8250df",
      keyword = "#cf222e",
      storage = "#cf222e",
      string = "#0a3069",
      support = "#0550ae",
      variable = "#953800"
    }
  },
  checks = {
    bg = "#24292f",
    runBorderWidth = "0px",
    containerBorderWidth = "0px",
    textPrimary = "#f6f8fa",
    textSecondary = "#8c959f",
    textLink = "#54aeff",
    btnIcon = "#afb8c1",
    btnHoverIcon = "#f6f8fa",
    btnHoverBg = "rgba(255,255,255,0.125)",
    inputText = "#eaeef2",
    inputPlaceholderText = "#8c959f",
    inputFocusText = "#8c959f",
    inputBg = "#32383f",
    inputShadow = "none",
    donutError = "#fa4549",
    donutPending = "#bf8700",
    donutSuccess = "#2da44e",
    donutNeutral = "#afb8c1",
    dropdownText = "#afb8c1",
    dropdownBg = "#32383f",
    dropdownBorder = "#424a53",
    dropdownShadow = "rgba(27,31,36,0.3)",
    dropdownHoverText = "#f6f8fa",
    dropdownHoverBg = "#424a53",
    dropdownBtnHoverText = "#f6f8fa",
    dropdownBtnHoverBg = "#32383f",
    scrollbarThumbBg = "#57606a",
    headerLabelText = "#d0d7de",
    headerLabelOpenText = "#f6f8fa",
    headerBorder = "#32383f",
    headerIcon = "#8c959f",
    lineText = "#d0d7de",
    lineNumText = "rgba(140,149,159,0.75)",
    lineTimestampText = "#8c959f",
    lineHoverBg = "#32383f",
    lineSelectedBg = "rgba(33,139,255,0.15)",
    lineSelectedNumText = "#54aeff",
    lineDtFmText = "#24292f",
    lineDtFmBg = "#9a6700",
    gateBg = "rgba(125,78,0,0.15)",
    gateText = "#d0d7de",
    gateWaitingText = "#d4a72c",
    stepHeaderOpenBg = "#32383f",
    stepErrorText = "#ff8182",
    stepWarningText = "#d4a72c",
    loglineText = "#8c959f",
    loglineNumText = "rgba(140,149,159,0.75)",
    loglineDebugText = "#c297ff",
    loglineErrorText = "#d0d7de",
    loglineErrorNumText = "#ff8182",
    loglineErrorBg = "rgba(164,14,38,0.15)",
    loglineWarningText = "#d0d7de",
    loglineWarningNumText = "#d4a72c",
    loglineWarningBg = "rgba(125,78,0,0.15)",
    loglineCommandText = "#54aeff",
    loglineSectionText = "#4ac26b",
    ansi = {
      black = "#24292f",
      blackBright = "#32383f",
      white = "#d0d7de",
      whiteBright = "#d0d7de",
      gray = "#8c959f",
      red = "#ff8182",
      redBright = "#ffaba8",
      green = "#4ac26b",
      greenBright = "#6fdd8b",
      yellow = "#d4a72c",
      yellowBright = "#eac54f",
      blue = "#54aeff",
      blueBright = "#80ccff",
      magenta = "#c297ff",
      magentaBright = "#d8b9ff",
      cyan = "#76e3ea",
      cyanBright = "#b3f0ff"
    }
  },
  project = {
    headerBg = "#24292f",
    sidebarBg = "#ffffff",
    gradientIn = "#ffffff",
    gradientOut = "rgba(255,255,255,0)"
  },
  mktg = {
    btn = {
      bg = "#1b1f23",
      shadow = {
        outline = "rgb(0 0 0 / 15%) 0 0 0 1px inset",
        focus = "rgb(0 0 0 / 15%) 0 0 0 4px",
        hover = "0 3px 2px rgba(0, 0, 0, 0.07), 0 7px 5px rgba(0, 0, 0, 0.04), 0 12px 10px rgba(0, 0, 0, 0.03), 0 22px 18px rgba(0, 0, 0, 0.03), 0 42px 33px rgba(0, 0, 0, 0.02), 0 100px 80px rgba(0, 0, 0, 0.02)",
        hoverMuted = "rgb(0 0 0 / 70%) 0 0 0 2px inset"
      }
    }
  },
  avatar = {
    bg = "#ffffff",
    border = "rgba(27,31,36,0.15)",
    stackFade = "#afb8c1",
    stackFadeMore = "#d0d7de",
    childShadow = "-2px -2px 0 rgba(255,255,255,0.8)"
  },
  topicTag = {
    border = "rgba(0,0,0,0)"
  },
  counter = {
    border = "rgba(0,0,0,0)"
  },
  selectMenu = {
    backdropBorder = "rgba(0,0,0,0)",
    tapHighlight = "rgba(175,184,193,0.5)",
    tapFocusBg = "#b6e3ff"
  },
  overlay = {
    shadow = "0 1px 3px rgba(27,31,36,0.12), 0 8px 24px rgba(66,74,83,0.12)"
  },
  header = {
    text = "rgba(255,255,255,0.7)",
    bg = "#24292f",
    divider = "#57606a",
    logo = "#ffffff"
  },
  headerSearch = {
    bg = "#24292f",
    border = "#57606a"
  },
  sidenav = {
    selectedBg = "#ffffff"
  },
  menu = {
    bgActive = "rgba(0,0,0,0)"
  },
  input = {
    disabledBg = "rgba(175,184,193,0.2)"
  },
  timeline = {
    badgeBg = "#eaeef2"
  },
  ansi = {
    black = "#24292f",
    blackBright = "#57606a",
    white = "#6e7781",
    whiteBright = "#8c959f",
    gray = "#6e7781",
    red = "#cf222e",
    redBright = "#a40e26",
    green = "#116329",
    greenBright = "#1a7f37",
    yellow = "#4d2d00",
    yellowBright = "#633c01",
    blue = "#0969da",
    blueBright = "#218bff",
    magenta = "#8250df",
    magentaBright = "#a475f9",
    cyan = "#1b7c83",
    cyanBright = "#3192aa"
  },
  btn = {
    text = "#24292f",
    bg = "#f6f8fa",
    border = "rgba(27,31,36,0.15)",
    shadow = "0 1px 0 rgba(27,31,36,0.04)",
    insetShadow = "inset 0 1px 0 rgba(255,255,255,0.25)",
    hoverBg = "#f3f4f6",
    hoverBorder = "rgba(27,31,36,0.15)",
    activeBg = "hsla(220,14%,93%,1)",
    activeBorder = "rgba(27,31,36,0.15)",
    selectedBg = "hsla(220,14%,94%,1)",
    focusBg = "#f6f8fa",
    focusBorder = "rgba(27,31,36,0.15)",
    focusShadow = "0 0 0 3px rgba(9,105,218,0.3)",
    shadowActive = "inset 0 0.15em 0.3em rgba(27,31,36,0.15)",
    shadowInputFocus = "0 0 0 0.2em rgba(9,105,218,0.3)",
    counterBg = "rgba(27,31,36,0.08)",
    primary = {
      text = "#ffffff",
      bg = "#2da44e",
      border = "rgba(27,31,36,0.15)",
      shadow = "0 1px 0 rgba(27,31,36,0.1)",
      insetShadow = "inset 0 1px 0 rgba(255,255,255,0.03)",
      hoverBg = "#2c974b",
      hoverBorder = "rgba(27,31,36,0.15)",
      selectedBg = "hsla(137,55%,36%,1)",
      selectedShadow = "inset 0 1px 0 rgba(0,45,17,0.2)",
      disabledText = "rgba(255,255,255,0.8)",
      disabledBg = "#94d3a2",
      disabledBorder = "rgba(27,31,36,0.15)",
      focusBg = "#2da44e",
      focusBorder = "rgba(27,31,36,0.15)",
      focusShadow = "0 0 0 3px rgba(45,164,78,0.4)",
      icon = "rgba(255,255,255,0.8)",
      counterBg = "rgba(255,255,255,0.2)"
    },
    outline = {
      text = "#0969da",
      hoverText = "#ffffff",
      hoverBg = "#0969da",
      hoverBorder = "rgba(27,31,36,0.15)",
      hoverShadow = "0 1px 0 rgba(27,31,36,0.1)",
      hoverInsetShadow = "inset 0 1px 0 rgba(255,255,255,0.03)",
      hoverCounterBg = "rgba(255,255,255,0.2)",
      selectedText = "#ffffff",
      selectedBg = "hsla(212,92%,42%,1)",
      selectedBorder = "rgba(27,31,36,0.15)",
      selectedShadow = "inset 0 1px 0 rgba(0,33,85,0.2)",
      disabledText = "rgba(9,105,218,0.5)",
      disabledBg = "#f6f8fa",
      disabledCounterBg = "rgba(9,105,218,0.05)",
      focusBorder = "rgba(27,31,36,0.15)",
      focusShadow = "0 0 0 3px rgba(5,80,174,0.4)",
      counterBg = "rgba(9,105,218,0.1)"
    },
    danger = {
      text = "#cf222e",
      hoverText = "#ffffff",
      hoverBg = "#a40e26",
      hoverBorder = "rgba(27,31,36,0.15)",
      hoverShadow = "0 1px 0 rgba(27,31,36,0.1)",
      hoverInsetShadow = "inset 0 1px 0 rgba(255,255,255,0.03)",
      hoverCounterBg = "rgba(255,255,255,0.2)",
      selectedText = "#ffffff",
      selectedBg = "hsla(356,72%,44%,1)",
      selectedBorder = "rgba(27,31,36,0.15)",
      selectedShadow = "inset 0 1px 0 rgba(76,0,20,0.2)",
      disabledText = "rgba(207,34,46,0.5)",
      disabledBg = "#f6f8fa",
      disabledCounterBg = "rgba(207,34,46,0.05)",
      focusBorder = "rgba(27,31,36,0.15)",
      focusShadow = "0 0 0 3px rgba(164,14,38,0.4)",
      counterBg = "rgba(207,34,46,0.1)",
      icon = "#cf222e",
      hoverIcon = "#ffffff"
    }
  },
  underlinenav = {
    icon = "#6e7781",
    borderHover = "rgba(175,184,193,0.2)"
  },
  actionListItem = {
    inlineDivider = "rgba(208,215,222,0.48)",
    default = {
      hoverBg = "rgba(208,215,222,0.32)",
      hoverBorder = "rgba(0,0,0,0)",
      activeBg = "rgba(208,215,222,0.48)",
      activeBorder = "rgba(0,0,0,0)",
      selectedBg = "rgba(208,215,222,0.24)"
    },
    danger = {
      hoverBg = "rgba(255,235,233,0.64)",
      activeBg = "#ffebe9",
      hoverText = "#cf222e"
    }
  },
  switchTrack = {
    bg = "#eaeef2",
    border = "#afb8c1",
    checked = {
      bg = "#ddf4ff",
      hoverBg = "#b6e3ff",
      activeBg = "#80ccff",
      border = "#54aeff"
    }
  },
  switchKnob = {
    checked = {
      bg = "#0969da",
      disabledBg = "#6e7781"
    }
  },
  segmentedControl = {
    bg = "#eaeef2",
    button = {
      hover = {
        bg = "rgba(175,184,193,0.2)"
      },
      active = {
        bg = "rgba(175,184,193,0.4)"
      },
      selected = {
        border = "#6e7781"
      }
    }
  },
  treeViewItem = {
    chevron = {
      hoverBg = "rgba(208,215,222,0.32)"
    },
    directory = {
      fill = "#54aeff"
    }
  },
  fg = {
    default = "#24292f",
    muted = "#57606a",
    subtle = "#6e7781",
    onEmphasis = "#ffffff"
  },
  canvas = {
    default = "#ffffff",
    overlay = "#ffffff",
    inset = "#f6f8fa",
    subtle = "#f6f8fa"
  },
  border = {
    default = "#d0d7de",
    muted = "hsla(210,18%,87%,1)",
    subtle = "rgba(27,31,36,0.15)"
  },
  shadow = {
    small = "0 1px 0 rgba(27,31,36,0.04)",
    medium = "0 3px 6px rgba(140,149,159,0.15)",
    large = "0 8px 24px rgba(140,149,159,0.2)",
    extraLarge = "0 12px 28px rgba(140,149,159,0.3)"
  },
  neutral = {
    emphasisPlus = "#24292f",
    emphasis = "#6e7781",
    muted = "rgba(175,184,193,0.2)",
    subtle = "rgba(234,238,242,0.5)"
  },
  accent = {
    fg = "#0969da",
    emphasis = "#0969da",
    muted = "rgba(84,174,255,0.4)",
    subtle = "#ddf4ff"
  },
  success = {
    fg = "#1a7f37",
    emphasis = "#2da44e",
    muted = "rgba(74,194,107,0.4)",
    subtle = "#dafbe1"
  },
  attention = {
    fg = "#9a6700",
    emphasis = "#bf8700",
    muted = "rgba(212,167,44,0.4)",
    subtle = "#fff8c5"
  },
  severe = {
    fg = "#bc4c00",
    emphasis = "#bc4c00",
    muted = "rgba(251,143,68,0.4)",
    subtle = "#fff1e5"
  },
  danger = {
    fg = "#cf222e",
    emphasis = "#cf222e",
    muted = "rgba(255,129,130,0.4)",
    subtle = "#ffebe9"
  },
  open = {
    fg = "#1a7f37",
    emphasis = "#2da44e",
    muted = "rgba(74,194,107,0.4)",
    subtle = "#dafbe1"
  },
  closed = {
    fg = "#cf222e",
    emphasis = "#cf222e",
    muted = "rgba(255,129,130,0.4)",
    subtle = "#ffebe9"
  },
  done = {
    fg = "#8250df",
    emphasis = "#8250df",
    muted = "rgba(194,151,255,0.4)",
    subtle = "#fbefff"
  },
  sponsors = {
    fg = "#bf3989",
    emphasis = "#bf3989",
    muted = "rgba(255,128,200,0.4)",
    subtle = "#ffeff7"
  },
  primer = {
    fg = {
      disabled = "#8c959f"
    },
    canvas = {
      backdrop = "rgba(27,31,36,0.5)",
      sticky = "rgba(255,255,255,0.95)"
    },
    border = {
      active = "#fd8c73",
      contrast = "rgba(27,31,36,0.1)"
    },
    shadow = {
      highlight = "inset 0 1px 0 rgba(255,255,255,0.25)",
      inset = "inset 0 1px 0 rgba(208,215,222,0.2)",
      focus = "0 0 0 3px rgba(9,105,218,0.3)"
    }
  },
  scale = {
    black = "#1b1f24",
    white = "#ffffff",
    gray = {
      "#f6f8fa",
      "#eaeef2",
      "#d0d7de",
      "#afb8c1",
      "#8c959f",
      "#6e7781",
      "#57606a",
      "#424a53",
      "#32383f",
      "#24292f"
    },
    blue = {
      "#ddf4ff",
      "#b6e3ff",
      "#80ccff",
      "#54aeff",
      "#218bff",
      "#0969da",
      "#0550ae",
      "#033d8b",
      "#0a3069",
      "#002155"
    },
    green = {
      "#dafbe1",
      "#aceebb",
      "#6fdd8b",
      "#4ac26b",
      "#2da44e",
      "#1a7f37",
      "#116329",
      "#044f1e",
      "#003d16",
      "#002d11"
    },
    yellow = {
      "#fff8c5",
      "#fae17d",
      "#eac54f",
      "#d4a72c",
      "#bf8700",
      "#9a6700",
      "#7d4e00",
      "#633c01",
      "#4d2d00",
      "#3b2300"
    },
    orange = {
      "#fff1e5",
      "#ffd8b5",
      "#ffb77c",
      "#fb8f44",
      "#e16f24",
      "#bc4c00",
      "#953800",
      "#762c00",
      "#5c2200",
      "#471700"
    },
    red = {
      "#ffebe9",
      "#ffcecb",
      "#ffaba8",
      "#ff8182",
      "#fa4549",
      "#cf222e",
      "#a40e26",
      "#82071e",
      "#660018",
      "#4c0014"
    },
    purple = {
      "#fbefff",
      "#ecd8ff",
      "#d8b9ff",
      "#c297ff",
      "#a475f9",
      "#8250df",
      "#6639ba",
      "#512a97",
      "#3e1f79",
      "#2e1461"
    },
    pink = {
      "#ffeff7",
      "#ffd3eb",
      "#ffadda",
      "#ff80c8",
      "#e85aad",
      "#bf3989",
      "#99286e",
      "#772057",
      "#611347",
      "#4d0336"
    },
    coral = {
      "#fff0eb",
      "#ffd6cc",
      "#ffb4a1",
      "#fd8c73",
      "#ec6547",
      "#c4432b",
      "#9e2f1c",
      "#801f0f",
      "#691105",
      "#510901"
    }
  }
}

return colors
