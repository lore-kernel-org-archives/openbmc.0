Return-Path: <mam.nagv@yahoo.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yahoo.com
 (client-ip=66.163.187.147; helo=sonic316-21.consmr.mail.ne1.yahoo.com;
 envelope-from=mam.nagv@yahoo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.b="pA2dpZv+"; 
 dkim-atps=neutral
Received: from sonic316-21.consmr.mail.ne1.yahoo.com
 (sonic316-21.consmr.mail.ne1.yahoo.com [66.163.187.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40HLwL5YF0zF1pr
 for <openbmc@lists.ozlabs.org>; Fri,  6 Apr 2018 11:00:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1522976430; bh=B7S2llsnuilbBGMJ0Zny8XhVbR4P4TPnXprwbUQX3Gk=;
 h=Date:From:To:Subject:References:From:Subject;
 b=pA2dpZv+7+KNiNjf2HAB8jwWYcPW9f7GxTt70bQ7WWKKUYRVXsZY69yaCa1pel0PGjAoNibwoHVjmc9SiujzdNgz7jVu9ePFMmKvAY0B1LrNNemFM4tsA9+smSL/fPCcjIT2nP/ygPDO7okLx17xKtxrN9SX6xzrDLbVZsAMOig5kZZYS++0TOg/zaXrv+ecIwqly62/TbJ2A2rMM3ad5H/73iLkxCSzilM0oukE6OlrGqH/CvQAy+OuqTf2ZwwD9iSwfRHZyGEO1WxOXdBcIRwNgTtCoddXPpOyJxIbqaJYOywRO9DwC5IdyaDZpZrmup3WSkq/K66YnLS61Thnpw==
X-YMail-OSG: Npv2GHwVM1kCZQmti1ogsi4b8OWJ4Wgnw3E2nTaHf5AcQ7DbSO6UaPO2d1zyiPE
 4dkkoc5fCp1daYRgszrzGnnRmzQLUVtwgt3bZPHpaiKgp.34s92T7189sYHUUDIiOEwLZhJI9MEk
 HE6VbJIgZBxrxHFH40sIbY69Xf5zePhxTNGxTONAlMcHekaRBOBOpexMg37.C1TSDJvZEIHnXh1F
 JIIwnm4hmho8s85jMIJ5EK2LbSf_Sz_zreMtoaZmbD6SbanXmIeKBvooPlYJ5vMvnVWm3MMYErgx
 iET_tpiy1JsQRoUl5JUFt.xI8_9OcbaleVQUAIVorBfxwdc6eyRCC3dn4JhsMvKRXiOiHgx1Gwqw
 wm.bTBJMwDnnKoWtSfxf81zZ.1SxoVryOroeIJU9S_Q_XwdCKdY5cn.Yc6_4A9oglDhtepkqrXO4
 4rUBkfouDKPddesLbaLGDVALgyjSfKavTuJXmpA8uEYCFLAYwMHEVLx7KNd9BwLJXQoKzZdYcRSm
 1pFrQMJEHpZdXz7GpECITSQ--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.ne1.yahoo.com with HTTP; Fri, 6 Apr 2018 01:00:30 +0000
Date: Fri, 6 Apr 2018 01:00:22 +0000 (UTC)
From: Mam Nag <mam.nagv@yahoo.com>
To: openbmc@lists.ozlabs.org
Message-ID: <1409586871.2278971.1522976422431@mail.yahoo.com>
Subject: Questions on openBMC compilation
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_2278970_858061385.1522976422428"
References: <1409586871.2278971.1522976422431.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.11701 YMailNorrin Mozilla/5.0 (Windows NT 6.3; Win64;
 x64; rv:59.0) Gecko/20100101 Firefox/59.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Apr 2018 01:00:36 -0000

------=_Part_2278970_858061385.1522976422428
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


Hello,

=C2=A0

I am working on supporting new platform which has AST2500.Some of the quest=
ions I have are:

=C2=A0

1.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0If I want to make changes to any open=
BMCcomponent for development, is folder =E2=80=9Copenbmc/build/tmp/work/=E2=
=80=9D right locationto make changes?

2.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0When I try to build openBMC for AST25=
00, nooption to configure the linux kernel. If I want to add new driver to =
the kernelto support new sensor chip. Once add the code into kernel=20

a.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 canI know which configuration file t=
o change in the linux kernel to enable newdriver. In standard kernel this c=
an be done through .config. However in openBMCwe didn=E2=80=99t find .confi=
g file.

b.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Oncestep =E2=80=9Ca=E2=80=9D is done how d=
o I recompile openBMC build? . Do I need to run =E2=80=9Cbitbakeobmc-phosph=
or-image=E2=80=9D again?. Will this take my changes done?. FYI: I made smal=
lone line change in kernel source code, reran =E2=80=9Cbitbake obmc-phospho=
r-image=E2=80=9D andgot message =E2=80=9CNOTE: Tasks Summary: Attempted 394=
0 tasks of which 3940 didn'tneed to be rerun and all succeeded=E2=80=9D =E2=
=80=93 looks like changes are not recognized.=20

3.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0I want add new sensor to =E2=80=9Crec=
ipes-phosphor/sensors/=E2=80=9D.(I have gone through =E2=80=9Cdocs/sensor-a=
rchitecture.md=E2=80=9D and couldn=E2=80=99t find detailsfor the below ques=
tions)

a.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Isthere any specific rules to name =
=E2=80=9C.conf=E2=80=9D file?

b.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ifthere are multiple sensors inside i2c bu=
s, how are =E2=80=9C.conf=E2=80=9D files for each ofthe sensors defined?

c.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Howdoes openBMC/phosphor know which =
i2c device register it has to talk to for aspecific sensor

4.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0How do I add this sensor to =E2=80=9C=
Dbus=E2=80=9D interface?.Does step 2 cover this?

5.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0How do I add sensor to =E2=80=9Chwmon=
=E2=80=9D

6.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Noticed there are many =E2=80=9Cbin=
=E2=80=9D files generatedafter the build, can I know which file to use to f=
lash that has =E2=80=9Cuboot+kernel+openbmc+=E2=80=A6=E2=80=9D.Can I flash =
this image on new system, without making any changes to openBMCcomponents ?

=C2=A0Thanks in advance for your help.



------=_Part_2278970_858061385.1522976422428
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div style=3D"font-family:Helvetica Neue, Helvetic=
a, Arial, sans-serif;font-size:13px;"><div><span><!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-US</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <m:mathPr>
   <m:mathFont m:val=3D"Cambria Math"/>
   <m:brkBin m:val=3D"before"/>
   <m:brkBinSub m:val=3D"&#45;-"/>
   <m:smallFrac m:val=3D"off"/>
   <m:dispDef/>
   <m:lMargin m:val=3D"0"/>
   <m:rMargin m:val=3D"0"/>
   <m:defJc m:val=3D"centerGroup"/>
   <m:wrapIndent m:val=3D"1440"/>
   <m:intLim m:val=3D"subSup"/>
   <m:naryLim m:val=3D"undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState=3D"false" DefUnhideWhenUsed=3D"false"
  DefSemiHidden=3D"false" DefQFormat=3D"false" DefPriority=3D"99"
  LatentStyleCount=3D"371">
  <w:LsdException Locked=3D"false" Priority=3D"0" QFormat=3D"true" Name=3D"=
Normal"/>
  <w:LsdException Locked=3D"false" Priority=3D"9" QFormat=3D"true" Name=3D"=
heading 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 7"/>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 8"/>
  <w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 9"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"index 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"index 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"index 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"index 4"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"index 5"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"index 6"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"index 7"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"index 8"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"index 9"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 7"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 8"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"toc 9"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Normal Indent"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"footnote text"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"annotation text"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"header"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"footer"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"index heading"/>
  <w:LsdException Locked=3D"false" Priority=3D"35" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"caption"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"table of figures"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"envelope address"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"envelope return"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"footnote reference"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"annotation reference"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"line number"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"page number"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"endnote reference"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"endnote text"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"table of authorities"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"macro"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"toa heading"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"List"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"List Bullet"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"List Number"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"List 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"List 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"List 4"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"List 5"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"List Bullet 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"List Bullet 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"List Bullet 4"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"List Bullet 5"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"List Number 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"List Number 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"List Number 4"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"List Number 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"10" QFormat=3D"true" Name=3D=
"Title"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Closing"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Signature"/>
  <w:LsdException Locked=3D"false" Priority=3D"1" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"Default Paragraph Font"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Body Text"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Body Text Indent"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"List Continue"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"List Continue 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"List Continue 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"List Continue 4"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"List Continue 5"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Message Header"/>
  <w:LsdException Locked=3D"false" Priority=3D"11" QFormat=3D"true" Name=3D=
"Subtitle"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Salutation"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Date"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Body Text First Indent"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Body Text First Indent 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Note Heading"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Body Text 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Body Text 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Body Text Indent 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Body Text Indent 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Block Text"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Hyperlink"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"FollowedHyperlink"/>
  <w:LsdException Locked=3D"false" Priority=3D"22" QFormat=3D"true" Name=3D=
"Strong"/>
  <w:LsdException Locked=3D"false" Priority=3D"20" QFormat=3D"true" Name=3D=
"Emphasis"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Document Map"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Plain Text"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"E-mail Signature"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"HTML Top of Form"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"HTML Bottom of Form"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Normal (Web)"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"HTML Acronym"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"HTML Address"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"HTML Cite"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"HTML Code"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"HTML Definition"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"HTML Keyboard"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"HTML Preformatted"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"HTML Sample"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"HTML Typewriter"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"HTML Variable"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Normal Table"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"annotation subject"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"No List"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Outline List 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Outline List 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Outline List 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Simple 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Simple 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Simple 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Classic 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Classic 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Classic 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Classic 4"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Colorful 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Colorful 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Colorful 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Columns 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Columns 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Columns 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Columns 4"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Columns 5"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Grid 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Grid 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Grid 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Grid 4"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Grid 5"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Grid 6"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Grid 7"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Grid 8"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table List 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table List 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table List 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table List 4"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table List 5"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table List 6"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table List 7"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table List 8"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table 3D effects 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table 3D effects 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table 3D effects 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Contemporary"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Elegant"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Professional"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Subtle 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Subtle 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Web 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Web 2"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Web 3"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Balloon Text"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" Name=3D"Table Grid"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" UnhideWhenUsed=3D"tr=
ue"
   Name=3D"Table Theme"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Name=3D"Placeholder =
Text"/>
  <w:LsdException Locked=3D"false" Priority=3D"1" QFormat=3D"true" Name=3D"=
No Spacing"/>
  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading"/>
  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List"/>
  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid"/>
  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading 1=
"/>
  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading 2=
"/>
  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List"/>
  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shading=
"/>
  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List"/>
  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid"/>
  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading Ac=
cent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List Accen=
t 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Accen=
t 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading 1=
 Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading 2=
 Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 Ac=
cent 1"/>
  <w:LsdException Locked=3D"false" SemiHidden=3D"true" Name=3D"Revision"/>
  <w:LsdException Locked=3D"false" Priority=3D"34" QFormat=3D"true"
   Name=3D"List Paragraph"/>
  <w:LsdException Locked=3D"false" Priority=3D"29" QFormat=3D"true" Name=3D=
"Quote"/>
  <w:LsdException Locked=3D"false" Priority=3D"30" QFormat=3D"true"
   Name=3D"Intense Quote"/>
  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 Ac=
cent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 Ac=
cent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 Ac=
cent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 Ac=
cent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Accent=
 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shading=
 Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List Ac=
cent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid Ac=
cent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading Ac=
cent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List Accen=
t 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Accen=
t 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading 1=
 Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading 2=
 Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 Ac=
cent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 Ac=
cent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 Ac=
cent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 Ac=
cent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 Ac=
cent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Accent=
 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shading=
 Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List Ac=
cent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid Ac=
cent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading Ac=
cent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List Accen=
t 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Accen=
t 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading 1=
 Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading 2=
 Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 Ac=
cent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 Ac=
cent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 Ac=
cent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 Ac=
cent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 Ac=
cent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Accent=
 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shading=
 Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List Ac=
cent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid Ac=
cent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading Ac=
cent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List Accen=
t 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Accen=
t 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading 1=
 Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading 2=
 Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 Ac=
cent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 Ac=
cent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 Ac=
cent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 Ac=
cent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 Ac=
cent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Accent=
 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shading=
 Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List Ac=
cent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid Ac=
cent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading Ac=
cent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List Accen=
t 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Accen=
t 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading 1=
 Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading 2=
 Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 Ac=
cent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 Ac=
cent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 Ac=
cent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 Ac=
cent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 Ac=
cent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Accent=
 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shading=
 Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List Ac=
cent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid Ac=
cent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading Ac=
cent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List Accen=
t 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid Accen=
t 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading 1=
 Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading 2=
 Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 Ac=
cent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 Ac=
cent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 Ac=
cent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 Ac=
cent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 Ac=
cent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List Accent=
 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful Shading=
 Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List Ac=
cent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid Ac=
cent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"19" QFormat=3D"true"
   Name=3D"Subtle Emphasis"/>
  <w:LsdException Locked=3D"false" Priority=3D"21" QFormat=3D"true"
   Name=3D"Intense Emphasis"/>
  <w:LsdException Locked=3D"false" Priority=3D"31" QFormat=3D"true"
   Name=3D"Subtle Reference"/>
  <w:LsdException Locked=3D"false" Priority=3D"32" QFormat=3D"true"
   Name=3D"Intense Reference"/>
  <w:LsdException Locked=3D"false" Priority=3D"33" QFormat=3D"true" Name=3D=
"Book Title"/>
  <w:LsdException Locked=3D"false" Priority=3D"37" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" Name=3D"Bibliography"/>
  <w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true"
   UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"TOC Heading"/>
  <w:LsdException Locked=3D"false" Priority=3D"41" Name=3D"Plain Table 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"42" Name=3D"Plain Table 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"43" Name=3D"Plain Table 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"44" Name=3D"Plain Table 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"45" Name=3D"Plain Table 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"40" Name=3D"Grid Table Light=
"/>
  <w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 Lig=
ht"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Dar=
k"/>
  <w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 Col=
orful"/>
  <w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 Col=
orful"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 Acc=
ent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Acc=
ent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Acc=
ent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Dar=
k Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 Acc=
ent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Acc=
ent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Acc=
ent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Dar=
k Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 Acc=
ent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Acc=
ent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Acc=
ent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Dar=
k Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 Acc=
ent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Acc=
ent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Acc=
ent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Dar=
k Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 Acc=
ent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Acc=
ent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Acc=
ent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Dar=
k Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 Acc=
ent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 Acc=
ent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 Acc=
ent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 Dar=
k Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 Lig=
ht"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Dar=
k"/>
  <w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 Col=
orful"/>
  <w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 Col=
orful"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"List Table 1 Light Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 Acc=
ent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 Acc=
ent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 Acc=
ent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Dar=
k Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"List Table 1 Light Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 Acc=
ent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 Acc=
ent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 Acc=
ent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Dar=
k Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"List Table 1 Light Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 Acc=
ent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 Acc=
ent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 Acc=
ent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Dar=
k Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"List Table 1 Light Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 Acc=
ent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 Acc=
ent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 Acc=
ent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Dar=
k Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"List Table 1 Light Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 Acc=
ent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 Acc=
ent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 Acc=
ent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Dar=
k Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked=3D"false" Priority=3D"46"
   Name=3D"List Table 1 Light Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 Acc=
ent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 Acc=
ent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 Acc=
ent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 Dar=
k Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"51"
   Name=3D"List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked=3D"false" Priority=3D"52"
   Name=3D"List Table 7 Colorful Accent 6"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
=09{mso-style-name:"Table Normal";
=09mso-tstyle-rowband-size:0;
=09mso-tstyle-colband-size:0;
=09mso-style-noshow:yes;
=09mso-style-priority:99;
=09mso-style-parent:"";
=09mso-padding-alt:0in 5.4pt 0in 5.4pt;
=09mso-para-margin:0in;
=09mso-para-margin-bottom:.0001pt;
=09mso-pagination:widow-orphan;
=09font-size:11.0pt;
=09font-family:"Calibri",sans-serif;
=09mso-ascii-font-family:Calibri;
=09mso-ascii-theme-font:minor-latin;
=09mso-hansi-font-family:Calibri;
=09mso-hansi-theme-font:minor-latin;}
</style>
<![endif]-->

<p class=3D"ydp6bbe60a1MsoNormal">Hello,</p>

<p class=3D"ydp6bbe60a1MsoNormal">&nbsp;</p>

<p class=3D"ydp6bbe60a1MsoNormal">I am working on supporting new platform w=
hich has AST2500.
Some of the questions I have are:</p>

<p class=3D"ydp6bbe60a1MsoNormal">&nbsp;</p>

<p class=3D"ydp6bbe60a1MsoListParagraph"><span><span>1.<span style=3D"font-=
style: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; l=
ine-height: normal; font-family: &quot;Times New Roman&quot;; font-size-adj=
ust: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span>If I want to make changes to any openBMC
component for development, is folder =E2=80=9Copenbmc/build/tmp/work/=E2=80=
=9D right location
to make changes?</p>

<p class=3D"ydp6bbe60a1MsoListParagraph"><span><span>2.<span style=3D"font-=
style: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; l=
ine-height: normal; font-family: &quot;Times New Roman&quot;; font-size-adj=
ust: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span>When I try to build openBMC for AST2500, no
option to configure the linux kernel. If I want to add new driver to the ke=
rnel
to support new sensor chip. Once add the code into kernel </p>

<p class=3D"ydp6bbe60a1MsoListParagraph" style=3D"margin-left: 1in;"><span>=
<span>a.<span style=3D"font-style: normal; font-weight: normal; font-stretc=
h: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times Ne=
w Roman&quot;; font-size-adjust: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; </span></span></span>can
I know which configuration file to change in the linux kernel to enable new
driver. In standard kernel this can be done through .config. However in ope=
nBMC
we didn=E2=80=99t find .config file.</p>

<p class=3D"ydp6bbe60a1MsoListParagraph" style=3D"margin-left: 1in;"><span>=
<span>b.<span style=3D"font-style: normal; font-weight: normal; font-stretc=
h: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times Ne=
w Roman&quot;; font-size-adjust: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </sp=
an></span></span>Once
step =E2=80=9Ca=E2=80=9D is done how do I recompile openBMC build? . Do I n=
eed to run =E2=80=9Cbitbake
obmc-phosphor-image=E2=80=9D again?. Will this take my changes done?. FYI: =
I made small
one line change in kernel source code, reran =E2=80=9Cbitbake obmc-phosphor=
-image=E2=80=9D and
got message =E2=80=9CNOTE: Tasks Summary: Attempted 3940 tasks of which 394=
0 didn't
need to be rerun and all succeeded=E2=80=9D =E2=80=93 looks like changes ar=
e not recognized. </p>

<p class=3D"ydp6bbe60a1MsoListParagraph"><span><span>3.<span style=3D"font-=
style: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; l=
ine-height: normal; font-family: &quot;Times New Roman&quot;; font-size-adj=
ust: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span>I want add new sensor to =E2=80=9Crecipes-phosphor/sen=
sors/=E2=80=9D.
(I have gone through =E2=80=9Cdocs/sensor-architecture.md=E2=80=9D and coul=
dn=E2=80=99t find details
for the below questions)</p>

<p class=3D"ydp6bbe60a1MsoListParagraph" style=3D"margin-left: 1in;"><span>=
<span>a.<span style=3D"font-style: normal; font-weight: normal; font-stretc=
h: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times Ne=
w Roman&quot;; font-size-adjust: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; </span></span></span>Is
there any specific rules to name =E2=80=9C.conf=E2=80=9D file?</p>

<p class=3D"ydp6bbe60a1MsoListParagraph" style=3D"margin-left: 1in;"><span>=
<span>b.<span style=3D"font-style: normal; font-weight: normal; font-stretc=
h: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times Ne=
w Roman&quot;; font-size-adjust: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </sp=
an></span></span>If
there are multiple sensors inside i2c bus, how are =E2=80=9C.conf=E2=80=9D =
files for each of
the sensors defined?</p>

<p class=3D"ydp6bbe60a1MsoListParagraph" style=3D"margin-left: 1in;"><span>=
<span>c.<span style=3D"font-style: normal; font-weight: normal; font-stretc=
h: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times Ne=
w Roman&quot;; font-size-adjust: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; </span></span></span>How
does openBMC/phosphor know which i2c device register it has to talk to for =
a
specific sensor</p>

<p class=3D"ydp6bbe60a1MsoListParagraph"><span><span>4.<span style=3D"font-=
style: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; l=
ine-height: normal; font-family: &quot;Times New Roman&quot;; font-size-adj=
ust: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span>How do I add this sensor to =E2=80=9CDbus=E2=80=9D int=
erface?.
Does step 2 cover this?</p>

<p class=3D"ydp6bbe60a1MsoListParagraph"><span><span>5.<span style=3D"font-=
style: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; l=
ine-height: normal; font-family: &quot;Times New Roman&quot;; font-size-adj=
ust: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span>How do I add sensor to =E2=80=9Chwmon=E2=80=9D</p>

<p class=3D"ydp6bbe60a1MsoListParagraph"><span><span>6.<span style=3D"font-=
style: normal; font-weight: normal; font-stretch: normal; font-size: 7pt; l=
ine-height: normal; font-family: &quot;Times New Roman&quot;; font-size-adj=
ust: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span>Noticed there are many =E2=80=9Cbin=E2=80=9D files gen=
erated
after the build, can I know which file to use to flash that has =E2=80=9Cub=
oot+kernel+openbmc+=E2=80=A6=E2=80=9D.
Can I flash this image on new system, without making any changes to openBMC
components ?</p>

<p class=3D"ydp6bbe60a1MsoListParagraph">&nbsp;Thanks in advance for your h=
elp.<br></p>

</span><br></div></div></body></html>
------=_Part_2278970_858061385.1522976422428--
