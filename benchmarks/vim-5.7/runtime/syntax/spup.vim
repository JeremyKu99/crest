" Vim syntax file
" Language:		Speedup, plant simulator from AspenTech
" Maintainer:	Stefan.Schwarzer <Stefan.Schwarzer@tu-clausthal.de>
" URL:			http://home.tu-clausthal.de/~svss/vim/spup.vim
" Last Change:	1999 Jul 7
" Filename:		spup.vim

" Bugs
" - in the appropriate sections keywords are always highlighted
"   even if they are not used with the appropriate meaning;
"   example: in
"       MODEL demonstration
"       TYPE
"      *area AS area
"   both "area" are highlighted as spupType.
"
" If you encounter problems or have questions or suggestions, mail me

" don't hightlight several keywords like subsections
"let strict_subsections = 1

" highlight types usually found in DECLARE section
let highlight_types = 1

" one line comment syntax (# comments)
" 1. allow appended code after comment, do not complain
" 2. show code beginnig with the second # as an error
" 3. show whole lines with more than one # as an error
let oneline_comments = 2

syn clear

" Speedup SECTION regions
syn case ignore
syn region spupCdi        matchgroup=spupSection start="^CDI"        end="^\*\*\*\*" contains=spupCdiSubs,@spupOrdinary
syn region spupConditions matchgroup=spupSection start="^CONDITIONS" end="^\*\*\*\*" contains=spupConditionsSubs,@spupOrdinary,spupConditional,spupOperator,spupCode
syn region spupDeclare    matchgroup=spupSection start="^DECLARE"    end="^\*\*\*\*" contains=spupDeclareSubs,@spupOrdinary,spupTypes,spupCode
syn region spupEstimation matchgroup=spupSection start="^ESTIMATION" end="^\*\*\*\*" contains=spupEstimationSubs,@spupOrdinary
syn region spupExternal   matchgroup=spupSection start="^EXTERNAL"   end="^\*\*\*\*" contains=spupExternalSubs,@spupOrdinary
syn region spupFlowsheet  matchgroup=spupSection start="^FLOWSHEET"  end="^\*\*\*\*" contains=spupFlowsheetSubs,@spupOrdinary,spupStreams
syn region spupFunction   matchgroup=spupSection start="^FUNCTION"   end="^\*\*\*\*" contains=spupFunctionSubs,@spupOrdinary,spupHelp,spupCode,spupTypes
syn region spupGlobal     matchgroup=spupSection start="^GLOBAL"     end="^\*\*\*\*" contains=spupGlobalSubs,@spupOrdinary
syn region spupHomotopy   matchgroup=spupSection start="^HOMOTOPY"   end="^\*\*\*\*" contains=spupHomotopySubs,@spupOrdinary
syn region spupMacro      matchgroup=spupSection start="^MACRO"      end="^\*\*\*\*" contains=spupMacroSubs,@spupOrdinary,@spupTextproc,spupTypes,spupStreams,spupOperator
syn region spupModel      matchgroup=spupSection start="^MODEL"      end="^\*\*\*\*" contains=spupModelSubs,@spupOrdinary,spupConditional,spupOperator,spupTypes,spupStreams,@spupTextproc,spupHelp
syn region spupOperation  matchgroup=spupSection start="^OPERATION"  end="^\*\*\*\*" contains=spupOperationSubs,@spupOrdinary,@spupTextproc
syn region spupOptions    matchgroup=spupSection start="^OPTIONS"    end="^\*\*\*\*" contains=spupOptionsSubs,@spupOrdinary
syn region spupProcedure  matchgroup=spupSection start="^PROCEDURE"  end="^\*\*\*\*" contains=spupProcedureSubs,@spupOrdinary,spupHelp,spupCode,spupTypes
syn region spupProfiles   matchgroup=spupSection start="^PROFILES"   end="^\*\*\*\*" contains=@spupOrdinary,@spupTextproc
syn region spupReport     matchgroup=spupSection start="^REPORT"     end="^\*\*\*\*" contains=spupReportSubs,@spupOrdinary,spupHelp,@spupTextproc
syn region spupTitle      matchgroup=spupSection start="^TITLE"      end="^\*\*\*\*" contains=spupTitleSubs,spupComment,spupConstant,spupError
syn region spupUnit       matchgroup=spupSection start="^UNIT"       end="^\*\*\*\*" contains=spupUnitSubs,@spupOrdinary

" Subsections
syn keyword spupCdiSubs        INPUT FREE OUTPUT LINEARTIME MINNONZERO CALCULATE FILES SCALING contained
syn keyword spupDeclareSubs    TYPE STREAM contained
syn keyword spupEstimationSubs ESTIMATE SSEXP DYNEXP RESULT contained
syn keyword spupExternalSubs   TRANSMIT RECEIVE contained
syn keyword spupFlowsheetSubs  STREAM contained
syn keyword spupFunctionSubs   INPUT OUTPUT contained
syn keyword spupGlobalSubs     VARIABLES MAXIMIZE MINIMIZE CONSTRAINT contained
syn keyword spupHomotopySubs   VARY OPTIONS contained
syn keyword spupMacroSubs      MODEL FLOWSHEET contained
syn keyword spupModelSubs      CATEGORY SET TYPE STREAM EQUATION PROCEDURE contained
syn keyword spupOperationSubs  SET PRESET INITIAL SSTATE FREE contained
syn keyword spupOptionsSubs    ROUTINES TRANSLATE EXECUTION contained
syn keyword spupProcedureSubs  INPUT OUTPUT SPACE PRECALL POSTCALL DERIVATIVE STREAM contained
" no subsections for Profiles
syn keyword spupReportSubs     SET INITIAL FIELDS FIELDMARK DISPLAY WITHIN contained
syn keyword spupUnitSubs       ROUTINES SET contained

" additional keywords for subsections
if !exists( "strict_subsections" )
    syn keyword spupConditionsSubs STOP PRINT contained
    syn keyword spupDeclareSubs    UNIT SET COMPONENTS THERMO OPTIONS contained
    syn keyword spupEstimationSubs VARY MEASURE INITIAL contained
    syn keyword spupFlowsheetSubs  TYPE FEED PRODUCT INPUT OUTPUT OF IS contained
    syn keyword spupMacroSubs      CONNECTION STREAM SET INPUT OUTPUT OF IS FEED PRODUCT TYPE contained
    syn keyword spupModelSubs      AS ARRAY OF INPUT OUTPUT CONNECTION contained
    syn keyword spupOperationSubs  WITHIN contained
    syn keyword spupReportSubs     LEFT RIGHT CENTER CENTRE UOM TIME DATE VERSION RELDATE contained
    syn keyword spupUnitSubs       IS A contained
endif

" Speedup data types
if exists( "highlight_types" )
    syn keyword spupTypes act_coeff_liq area coefficient concentration contained
    syn keyword spupTypes control_signal cond_liq cond_vap cp_mass_liq contained
    syn keyword spupTypes cp_mol_liq cp_mol_vap cv_mol_liq cv_mol_vap contained
    syn keyword spupTypes diffus_liq diffus_vap delta_p dens_mass contained
    syn keyword spupTypes dens_mass_sol dens_mass_liq dens_mass_vap dens_mol contained
    syn keyword spupTypes dens_mol_sol dens_mol_liq dens_mol_vap enthflow contained
    syn keyword spupTypes enth_mass enth_mass_liq enth_mass_vap enth_mol contained
    syn keyword spupTypes enth_mol_sol enth_mol_liq enth_mol_vap entr_mol contained
    syn keyword spupTypes entr_mol_sol entr_mol_liq entr_mol_vap fraction contained
    syn keyword spupTypes flow_mass flow_mass_liq flow_mass_vap flow_mol contained
    syn keyword spupTypes flow_mol_vap flow_mol_liq flow_vol flow_vol_vap contained
    syn keyword spupTypes flow_vol_liq fuga_vap fuga_liq fuga_sol contained
    syn keyword spupTypes gibb_mol_sol heat_react heat_trans_coeff contained
    syn keyword spupTypes holdup_heat holdup_heat_liq holdup_heat_vap contained
    syn keyword spupTypes holdup_mass holdup_mass_liq holdup_mass_vap contained
    syn keyword spupTypes holdup_mol holdup_mol_liq holdup_mol_vap k_value contained
    syn keyword spupTypes length length_delta length_short liqfraction contained
    syn keyword spupTypes liqmassfraction mass massfraction molefraction contained
    syn keyword spupTypes molweight moment_inertia negative notype percent contained
    syn keyword spupTypes positive pressure press_diff press_drop press_rise contained
    syn keyword spupTypes ratio reaction reaction_mass rotation surf_tens contained
    syn keyword spupTypes temperature temperature_abs temp_diff temp_drop contained
    syn keyword spupTypes temp_rise time vapfraction vapmassfraction contained
    syn keyword spupTypes velocity visc_liq visc_vap volume zmom_rate contained
    syn keyword spupTypes seg_rate smom_rate tmom_rate zmom_mass seg_mass contained
    syn keyword spupTypes smom_mass tmom_mass zmom_holdup seg_holdup contained
    syn keyword spupTypes smom_holdup tmom_holdup contained
endif

" stream types
syn keyword spupStreams  mainstream vapour liquid contained

" "conditional" keywords
syn keyword spupConditional  IF THEN ELSE ENDIF contained
" Operators, symbols etc.
syn keyword spupOperator  AND OR NOT contained
syn match spupSymbol  "[,\-+=:;*/\"<>@%()]" contained
syn match spupSpecial  "[&\$?]" contained
" Surprisingly, Speedup allows no unary + instead of the -
syn match spupError  "[(=+\-*/]\s*+\d\+\([ed][+-]\=\d\+\)\=\>"lc=1 contained
syn match spupError  "[(=+\-*/]\s*+\d\+\.\([ed][+-]\=\d\+\)\=\>"lc=1 contained
syn match spupError  "[(=+\-*/]\s*+\d*\.\d\+\([ed][+-]\=\d\+\)\=\>"lc=1 contained
" String
syn region spupString  start=+"+  end=+"+  oneline contained
syn region spupString  start=+'+  end=+'+  oneline contained
" Identifier
syn match spupIdentifier  "\<[a-z][a-z0-9_]*\>" contained
" Textprocessor directives
syn match spupTextprocGeneric  "?[a-z][a-z0-9_]*\>" contained
syn region spupTextprocError matchgroup=spupTextprocGeneric start="?ERROR"  end="?END"he=s-1 contained
" Number, without decimal point
syn match spupNumber  "-\=\d\+\([ed][+-]\=\d\+\)\=" contained
" Number, allows 1. before exponent
syn match spupNumber  "-\=\d\+\.\([ed][+-]\=\d\+\)\=" contained
" Number allows .1 before exponent
syn match spupNumber  "-\=\d*\.\d\+\([ed][+-]\=\d\+\)\=" contained
" Help subsections
syn region spupHelp  start="^HELP"hs=e+1  end="^\$ENDHELP"he=s-1 contained
" Fortran code
syn region spupCode  start="^CODE"hs=e+1  end="^\$ENDCODE"he=s-1 contained
" oneline comments
if oneline_comments > 3
    oneline_comments = 2   " default
endif
if oneline_comments == 1
    syn match spupComment  "#[^#]*#\="
elseif oneline_comments == 2
    syn match spupError  "#.*$"
    syn match spupComment  "#[^#]*"  nextgroup=spupError
elseif oneline_comments == 3
    syn match spupComment  "#[^#]*"
    syn match spupError  "#[^#]*#.*"
endif
" multiline comments
syn match spupOpenBrace "{" contained
syn match spupError  "}"
syn region spupComment  matchgroup=spupComment2  start="{"  end="}"  keepend  contains=spupOpenBrace

syn cluster spupOrdinary  contains=spupNumber,spupIdentifier,spupSymbol
syn cluster spupOrdinary  add=spupError,spupString,spupComment
syn cluster spupTextproc  contains=spupTextprocGeneric,spupTextprocError

" define syncronizing; especially OPERATION sections can become very large
syn sync clear
syn sync minlines=100
syn sync maxlines=500

syn sync match spupSyncOperation  grouphere spupOperation  "^OPERATION"
syn sync match spupSyncCdi        grouphere spupCdi        "^CDI"
syn sync match spupSyncConditions grouphere spupConditions "^CONDITIONS"
syn sync match spupSyncDeclare    grouphere spupDeclare    "^DECLARE"
syn sync match spupSyncEstimation grouphere spupEstimation "^ESTIMATION"
syn sync match spupSyncExternal   grouphere spupExternal   "^EXTERNAL"
syn sync match spupSyncFlowsheet  grouphere spupFlowsheet  "^FLOWSHEET"
syn sync match spupSyncFunction   grouphere spupFunction   "^FUNCTION"
syn sync match spupSyncGlobal     grouphere spupGlobal     "^GLOBAL"
syn sync match spupSyncHomotopy   grouphere spupHomotopy   "^HOMOTOPY"
syn sync match spupSyncMacro      grouphere spupMacro      "^MACRO"
syn sync match spupSyncModel      grouphere spupModel      "^MODEL"
syn sync match spupSyncOperation  grouphere spupOperation  "^OPERATION"
syn sync match spupSyncOptions    grouphere spupOptions    "^OPTIONS"
syn sync match spupSyncProcedure  grouphere spupProcedure  "^PROCEDURE"
syn sync match spupSyncProfiles   grouphere spupProfiles   "^PROFILES"
syn sync match spupSyncReport     grouphere spupReport     "^REPORT"
syn sync match spupSyncTitle      grouphere spupTitle      "^TITLE"
syn sync match spupSyncUnit       grouphere spupUnit       "^UNIT"

if !exists( "did_spup_syntax_inits" )
    let did_spup_syntax_inits = 1

    hi link spupCdi        spupSection
    hi link spupConditions spupSection
    hi link spupDeclare    spupSection
    hi link spupEstimation spupSection
    hi link spupExternal   spupSection
    hi link spupFlowsheet  spupSection
    hi link spupFunction   spupSection
    hi link spupGlobal     spupSection
    hi link spupHomotopy   spupSection
    hi link spupMacro      spupSection
    hi link spupModel      spupSection
    hi link spupOperation  spupSection
    hi link spupOptions    spupSection
    hi link spupProcedure  spupSection
    hi link spupProfiles   spupSection
    hi link spupReport     spupSection
    hi link spupTitle      spupConstant  " this is correct, truly ;)
    hi link spupUnit       spupSection

    hi link spupCdiSubs        spupSubs
    hi link spupConditionsSubs spupSubs
    hi link spupDeclareSubs    spupSubs
    hi link spupEstimationSubs spupSubs
    hi link spupExternalSubs   spupSubs
    hi link spupFlowsheetSubs  spupSubs
    hi link spupFunctionSubs   spupSubs
    hi link spupHomotopySubs   spupSubs
    hi link spupMacroSubs      spupSubs
    hi link spupModelSubs      spupSubs
    hi link spupOperationSubs  spupSubs
    hi link spupOptionsSubs    spupSubs
    hi link spupProcedureSubs  spupSubs
    hi link spupReportSubs     spupSubs
    hi link spupUnitSubs       spupSubs

    hi link spupCode            Normal
    hi link spupComment         Comment
    hi link spupComment2        spupComment
    hi link spupConditional     Statement
    hi link spupConstant        Constant
    hi link spupError           Error
    hi link spupHelp            Normal
    hi link spupIdentifier      Identifier
    hi link spupNumber          Constant
    hi link spupOperator        Special
    hi link spupOpenBrace       spupError
    hi link spupSection         Statement
    hi link spupSpecial         spupTextprocGeneric
    hi link spupStreams         Type
    hi link spupString          Constant
    hi link spupSubs            Statement
    hi link spupSymbol          Special
    hi link spupTextprocError   Normal
    hi link spupTextprocGeneric PreProc
    hi link spupTypes           Type
endif

let b:current_syntax = "spup"

" vim:ts=4