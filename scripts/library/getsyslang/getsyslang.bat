@echo off
setlocal enabledelayedexpansion
::::BgetDescription#Outputs the client set system language.
::::BgetAuthor#CR4YZ33
::::BgetCategory#library
:GetSystemLanguage
REM Module.GetSystemLanguage for aquisition of client set system language
REM Works in: XP/Vista/7/8/10
REM @ECHO OFF is required
REM EnableDelayedExpansion is required
REM Use REG QUERY /v for this operation
SET "RegQueryPath=HKLM\System\CurrentControlSet\Control\Nls\Language"
SET "RegQueryValue=InstallLanguage"
FOR %%A IN ("0436=af;Afrikaans" "041C=sq;Albanian" "0001=ar;Arabic" "0401=ar-sa;Arabic(SaudiArabia)" "0801=ar-iq;Arabic(Iraq)" "0C01=ar-eg;Arabic(Egypt)" "1001=ar-ly;Arabic(Libya)" "1401=ar-dz;Arabic(Algeria)" "1801=ar-ma;Arabic(Morocco)" "1C01=ar-tn;Arabic(Tunisia)" "2001=ar-om;Arabic(Oman)" "2401=ar-ye;Arabic(Yemen)" "2801=ar-sy;Arabic(Syria)" "2C01=ar-jo;Arabic(Jordan)" "3001=ar-lb;Arabic(Lebanon)" "3401=ar-kw;Arabic(Kuwait)" "3801=ar-ae;Arabic(you.A.E.)" "3C01=ar-bh;Arabic(Bahrain)" "4001=ar-qa;Arabic(Qatar)" "042D=eu;Basque" "0402=bg;Bulgarian" "0423=be;Belarusian" "0403=ca;Catalan" "0004=zh;Chinese" "0404=zh-tw;Chinese(Taiwan)" "0804=zh-cn;Chinese(China)" "0C04=zh-hk;Chinese(HongKongSAR)" "1004=zh-sg;Chinese(Singapore)" "041A=hr;Croatian" "0405=cs;Czech" "0406=the;Danish" "0413=nl;Dutch(Netherlands)" "0813=nl-be;Dutch(Belgium)" "0009=en;English" "0409=en-us;English(UnitedStates)" "0809=en-gb;English(UnitedKingdom)" "0C09=en-au;English(Australia)" "1009=en-ca;English(Canada)" "1409=en-nz;English(NewZealand)" "1809=en-ie;English(Ireland)" "1C09=en-za;English(SouthAfrica)" "2009=en-jm;English(Jamaica)" "2809=en-bz;English(Belize)" "2C09=en-tt;English(Trinidad)" "0425=et;Estonian" "0438=fo;Faeroese" "0429=fa;Farsi" "040B=fi;Finnish" "040C=fr;French(France)" "080C=fr-be;French(Belgium)" "0C0C=fr-ca;French(Canada)" "100C=fr-ch;French(Switzerland)" "140C=fr-lu;French(Luxembourg)" "043C=gd;Gaelic" "0407=de;German(Germany)" "0807=de-ch;German(Switzerland)" "0C07=de-at;German(Austria)" "1007=de-lu;German(Luxembourg)" "1407=de-li;German(Liechtenstein)" "0408=el;Greek" "040D=he;Hebrew" "0439=hi;Hindi" "040E=hu;Hungarian" "040F=is;Icelandic" "0421=in;Indonesian" "0410=it;Italian(Italy)" "0810=it-ch;Italian(Switzerland)" "0411=ja;Japanese" "0412=ko;Korean" "0426=lv;Latvian" "0427=lt;Lithuanian" "042F=mk;FYROMacedonian" "043E=ms;Malay(Malaysia)" "043A=mt;Maltese" "0414=no;Norwegian(Bokmal)" "0814=no;Norwegian(Nynorsk)" "0415=pl;Polish" "0416=pt-br;Portuguese(Brazil)" "0816=pt;Portuguese(Portugal)" "0417=rm;Rhaeto-Romanic" "0418=ro;Romanian" "0818=ro-mo;Romanian(Moldova)" "0419=ru;Russian" "0819=ru-mo;Russian(Moldova)" "0C1A=sr;Serbian(Cyrillic)" "081A=sr;Serbian(Latin)" "041B=sk;Slovak" "0424=sl;Slovenian" "042E=sb;Sorbian" "040A=es;Spanish(TraditionalSort)" "080A=es-mx;Spanish(Mexico)" "0C0A=es;Spanish(InternationalSort)" "100A=es-gt;Spanish(Guatemala)" "140A=es-cr;Spanish(CostaRica)" "180A=es-pa;Spanish(Panama)" "1C0A=es-do;Spanish(DominicanRepublic)" "200A=es-ve;Spanish(Venezuela)" "240A=es-co;Spanish(Colombia)" "280A=es-pe;Spanish(Peru)" "2C0A=es-ar;Spanish(Argentina)" "300A=es-ec;Spanish(Ecuador)" "340A=es-cl;Spanish(Chile)" "380A=es-uy;Spanish(Uruguay)" "3C0A=es-py;Spanish(Paraguay)" "400A=es-bo;Spanish(Bolivia)" "440A=es-sv;Spanish(ElSalvador)" "480A=es-hn;Spanish(Honduras)" "4C0A=es-ni;Spanish(Nicaragua)" "500A=es-pr;Spanish(PuertoRico)" "0430=sx;Sutu" "041D=sv;Swedish" "081D=sv-fi;Swedish(Finland)" "041E=th;Thai" "0431=ts;Tsonga" "0432=tn;Tswana" "041F=tr;Turkish" "0422=uk;Ukrainian" "0420=your;Urdu" "042A=vi;Vietnamese" "0434=xh;Xhosa" "043D=ji;Yiddish" "0435=zu;Zulu") DO (
	SET %%A
)
FOR /F "skip=1 tokens=1,2,3" %%A IN ('REG QUERY !RegQueryPath! /v !RegQueryValue!') DO (
	SET "InstallLangCode=%%C"
)
SET "CurrentInstallLangCodeValue=!%InstallLangCode%!"
FOR /F "tokens=1,2 delims=;" %%A IN ("!CurrentInstallLangCodeValue!") DO (
	SET "CurrentCountryCode=%%A"
	SET "CurrentCountryDescription=%%B"
)
REM OutputVariables:
REM		!InstallLangCode!             = "0436" for Afrikaans;Set by REG QUERY
REM		!CurrentInstallLangCodeValue! = "af;Afrikaans" ;Converted from 0436 for Afrikaans
REM		!CurrentCountryCode!		  = "af" for Afrikaans
REM		!CurrentCountryDescription!   = "Afrikaans" from CurrentCountryCode "af"

EXIT /B