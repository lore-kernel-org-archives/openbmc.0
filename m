Return-Path: <mdevender@gmail.com>
Received: from mail-wm0-x232.google.com (mail-wm0-x232.google.com
 [IPv6:2a00:1450:400c:c09::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xcqHB5CdnzDqBb
 for <openbmc@lists.ozlabs.org>; Thu, 24 Aug 2017 00:16:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q9PknIHP"; 
 dkim-atps=neutral
Received: by mail-wm0-x232.google.com with SMTP id r187so2109920wma.0
 for <openbmc@lists.ozlabs.org>; Wed, 23 Aug 2017 07:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=gY47LvjHe8/UqcevXF5TpeBNzDqN+7OKv+ZPCkJpWQg=;
 b=Q9PknIHPX9LkZg2o4r7HZlW3FibKzvC7GJOmnnuPzj9G6VO3ZpJA71/wuMp8sGTZ+Q
 Ju9lIppi5ycajp/pk8oTDEHY5cczEhqjz+CPLxJ22Z13AzwLQJODyUscOIJFxmU8FADf
 wbNBEUD5trArbDzkjTfEeMYbhP7NZV+W1VkTMRMlwQbXz5TW0RV1cdiGaIUTeFAW8u35
 7xfN1ldaKRBSOCYsFHo63aEfy7yxDGnvfGIPebYB64CWNiQVUNGP6lCkHPeBw1Bo0H8D
 0xex6eWfrBNP7OPvUwKZGQz6RgtASHCtjfN0KevVU+BAmmu45lCBUIvLRhYrP0EPMc6f
 hXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=gY47LvjHe8/UqcevXF5TpeBNzDqN+7OKv+ZPCkJpWQg=;
 b=OuM9oV3D3Rp/L9CrHm7NGyTR/g6rQF1GTQVH88PEy/SFA7Z6fsGxohUxzXAqbMRB6Y
 dFQPdm+a0k1Ans5yGPWVJCh/BWp7v/UHdSByt+MLo2AXiKBvdOYh43V0mGzNeMXTu6ze
 SGGYbBuST+bR5JX50C4A02Xdh7uRJhs7JtZIyz6/Fw/r1cNgtaqtTLNbAXukwQ9aFhhE
 Kz7c/Q0hfAJ1VyszDRf0/L05eN6b1Te/03/qG6sUrRAKF6z//UbQo2VST16c5MBj5aBQ
 UEaSO72IK8SpaCiKPwx6TJcEqzsOoQ9i3tj+ckwUNxFf7zhHLpB8XpEVRsj7npD0QjVX
 zTqQ==
X-Gm-Message-State: AHYfb5jbpvtPMWf6ZaujCeNmW2kwbhuUvrl+0xctjLke45zYLA28NQD4
 3ZpStaddMEzc4+L/ok/TsqdqPC1R2hKI
X-Received: by 10.80.226.67 with SMTP id o3mr3446000edl.65.1503497794854; Wed,
 23 Aug 2017 07:16:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.218.139 with HTTP; Wed, 23 Aug 2017 07:16:34 -0700 (PDT)
From: Devender Rao <mdevender@gmail.com>
Date: Wed, 23 Aug 2017 19:46:34 +0530
Message-ID: <CAMzZgVd17xOEic7EyADFLuoFEMDRn-BxU7TqBEc8U=9yrb8xkQ@mail.gmail.com>
Subject: Application specific local errors
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="f403043e272cfbb13205576c5b71"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Aug 2017 14:16:39 -0000

--f403043e272cfbb13205576c5b71
Content-Type: text/plain; charset="UTF-8"

Hi All,

I'm working this sprint on https://github.com/openbmc/openbmc/issues/1772.

This story is to fix the CI issued noticed when new application specific
error YAML files are added. Fixed this by manually generating elog-errors.hpp
for the newly added error YAML file  by using the parser from
phosphor-logging and adding it as part of the application.

Proposal is to use autotools macro to generate the elog-errors.hpp instead
of manual process but noticed it solves the problem partially.

Recently noticed newer problems when applications use both DBUS errors and
error from the newly added error yaml file.
When <phoshpor-logging/elog-errors.hpp> is included for dbus related errors
and <elog-errors.hpp> for newly generated errors and when the code is
merged and newly added error comes in as part of
<phoshpor-logging/elog-errors.hpp>
we run into "error: redefinition" error.

Capturing below my observations in detail

*Current approach to fix CI failures noticed for newly added errors*
*Adding new application error*
 *  Generate elog-errors.hpp manually for the newly added error yaml and
check-in as part of the repository.
 *  Include "#include <elog-errors.hpp> in the application code.
 *  This approach works until the application does not throw any DBUS errors
*   Need to have follow up commit to remove "#include <elog-errors.hpp>"
and add  "#include <phoshpor-logging/elog-errors.hpp>"

*Adding new application error and also use existing dbus errors in the
application*
 *  Users ran into "error: redefinition" error when manually generated
"elog-errors.hpp" for new error yaml file and
"phosphor-logging/elog-errors.hpp" for DBUS errors is
     included in the same cpp file.
 *  Below specified approach is followed to overcome the problem
 *  Copy the "phosphor-logging/elog-errors.hpp" to the app
 *  Manually generate "elog-errors.hpp" for the newly added error yaml
 *  Merge contents of "phosphor-logging/elog-errors.hpp" and
"elog-errors.hpp" as "elog-errors.hpp".
 *  Include "<elog-errors.hpp>" as part of the application code


*Proposed solution*
*Proposal1 - Fixing the CI issue by timing the commits*
 *  Push first only the newly added error yaml file and the native recipe
that copies the error yaml first.
 *  After the above code is merged, generate new SDK which now has the
newly added error as part of <phosphor-logging/elog-errors.hpp>
 *  Applications can use newly generated <phosphor-logging/elog-errors.hpp>
 *  Users can manually / use auto-conf macro to generate elog-errors.hpp
and do testing till the error yaml and native recipe are merged and new SDK
is built.

*Proposal2 - Using autoconf to generate elog-errors.hpp*
 *  Place all the error yamls used by the app and newly added error yaml in
the app folder
 *  Use auto-conf macro to generate elog-errors.hpp for all the yaml files
placed in the app.
 *  Use generated "elog-errors.hpp" instead of
"<phosphor-logging/elog-errors.hpp>"
 *  Have a follow-up commit that removes "#include <elog-errors.hpp>"   and
add "#include<phosphor-logging/elog-errors.hpp>".
 *  Remove manually generated "elog-errors.hpp" file.

There could be other issues relating to inhering of errors from DBUS and
errors and e.t.c which need to be addressed.

Regards
Devender

--f403043e272cfbb13205576c5b71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><font size=3D"4"><span style=3D"font-family:aria=
l,helvetica,sans-serif">Hi All,<br><br>I&#39;m working this sprint on <a hr=
ef=3D"https://github.com/openbmc/openbmc/issues/1772">https://github.com/op=
enbmc/openbmc/issues/1772</a>.<br><br></span></font></div><font size=3D"4">=
<span style=3D"font-family:arial,helvetica,sans-serif">This story is to fix=
 the CI issued noticed when new application specific error YAML files are a=
dded. Fixed this by manually generating </span></font><font size=3D"4"><spa=
n style=3D"font-family:arial,helvetica,sans-serif"><font size=3D"4"><span s=
tyle=3D"font-family:arial,helvetica,sans-serif">elog-errors.hpp for the new=
ly added error YAML file=C2=A0</span></font> by using the parser from phosp=
hor-logging and adding it as part of the application.<br><br></span></font>=
</div><div><font size=3D"4"><span style=3D"font-family:arial,helvetica,sans=
-serif">Proposal is to use autotools macro to generate the elog-errors.hpp =
instead of manual process but noticed it solves the problem partially.<br><=
br>Recently noticed newer problems when applications use both DBUS errors a=
nd error from the newly added error yaml file. <br>When </span></font><font=
 size=3D"4"><span style=3D"font-family:arial,helvetica,sans-serif"><font si=
ze=3D"4"><span style=3D"font-family:arial,helvetica,sans-serif">&lt;phoshpo=
r-logging/elog-errors.hpp&gt; is included for dbus related errors and &lt;e=
log-errors.hpp&gt; for newly generated errors and when the code is merged a=
nd newly added error comes in as part of </span></font></span></font><font =
size=3D"4"><span style=3D"font-family:arial,helvetica,sans-serif"><font siz=
e=3D"4"><span style=3D"font-family:arial,helvetica,sans-serif"><font size=
=3D"4"><span style=3D"font-family:arial,helvetica,sans-serif"><font size=3D=
"4"><span style=3D"font-family:arial,helvetica,sans-serif">&lt;phoshpor-log=
ging/elog-errors.hpp&gt; we run into &quot;</span></font></span></font></sp=
an></font></span></font><font size=3D"4"><span style=3D"font-family:arial,h=
elvetica,sans-serif"><font size=3D"4"><span style=3D"font-family:arial,helv=
etica,sans-serif"><font size=3D"4"><span style=3D"font-family:arial,helveti=
ca,sans-serif"><font size=3D"4"><span style=3D"font-family:arial,helvetica,=
sans-serif"><font size=3D"4"><span style=3D"font-family:arial,helvetica,san=
s-serif">error: redefinition&quot; error.<br></span></font></span></font></=
span></font></span></font></span></font></div><div><font size=3D"4"><span s=
tyle=3D"font-family:arial,helvetica,sans-serif"><font size=3D"4"><span styl=
e=3D"font-family:arial,helvetica,sans-serif"><br></span></font></span></fon=
t></div><div><font size=3D"4"><span style=3D"font-family:arial,helvetica,sa=
ns-serif">Capturing below my observations in detail<br></span></font></div>=
<div><font size=3D"4"><span style=3D"font-family:arial,helvetica,sans-serif=
"><br><b>Current approach to fix CI failures noticed for newly added errors=
</b><br><b>Adding new application error</b><br>=C2=A0*=C2=A0 Generate elog-=
errors.hpp manually for the newly added error yaml and check-in as part of =
the repository.<br>=C2=A0*=C2=A0 Include &quot;#include &lt;elog-errors.hpp=
&gt; in the application code.<br>=C2=A0*=C2=A0 This approach works until th=
e application does not throw any DBUS errors<br>*=C2=A0=C2=A0 Need to have =
follow up commit to remove &quot;#include &lt;elog-errors.hpp&gt;&quot; and=
 add=C2=A0 &quot;#include &lt;phoshpor-logging/elog-errors.hpp&gt;&quot;<br=
><br><b>Adding new application error and also use existing dbus errors in t=
he application</b><br></span></font></div><div><font size=3D"4"><span style=
=3D"font-family:arial,helvetica,sans-serif">=C2=A0*=C2=A0 Users ran into &q=
uot;error: redefinition&quot; error when manually generated &quot;elog-erro=
rs.hpp&quot; for new error yaml file and &quot;phosphor-logging/elog-errors=
.hpp&quot; for DBUS errors is <br>=C2=A0 =C2=A0=C2=A0 included in the same =
cpp file.<br></span></font></div><div><font size=3D"4"><span style=3D"font-=
family:arial,helvetica,sans-serif">=C2=A0*=C2=A0 Below specified approach i=
s followed to overcome the problem <br></span></font></div><div><font size=
=3D"4"><span style=3D"font-family:arial,helvetica,sans-serif">=C2=A0*=C2=A0=
 Copy the &quot;phosphor-logging/elog-errors.hpp&quot; to the app<br>=C2=A0=
*=C2=A0 Manually generate &quot;elog-errors.hpp&quot; for the newly added e=
rror yaml<br>=C2=A0*=C2=A0 Merge contents of &quot;phosphor-logging/elog-er=
rors.hpp&quot; and &quot;elog-errors.hpp&quot; as &quot;elog-errors.hpp&quo=
t;.<br>=C2=A0*=C2=A0 Include &quot;&lt;elog-errors.hpp&gt;&quot; as part of=
 the application code<br><br><br><b>Proposed solution</b><br><b>Proposal1 -=
 Fixing the CI issue by timing the commits</b><br>=C2=A0*=C2=A0 Push first =
only the newly added error yaml file and the native recipe that copies the =
error yaml first.<br>=C2=A0*=C2=A0 After the above code is merged, generate=
 new SDK which now has the newly added error as part of &lt;phosphor-loggin=
g/elog-errors.hpp&gt;<br>=C2=A0*=C2=A0 Applications can use newly generated=
 &lt;phosphor-logging/elog-errors.hpp&gt; <br>=C2=A0*=C2=A0 Users can manua=
lly / use auto-conf macro to generate elog-errors.hpp and do testing till t=
he error yaml and native recipe are merged and new SDK is built.<br><br><b>=
Proposal2 - Using autoconf to generate elog-errors.hpp</b><br>=C2=A0*=C2=A0=
 Place all the error yamls used by the app and newly added error yaml in th=
e app folder<br>=C2=A0*=C2=A0 Use auto-conf macro to generate elog-errors.h=
pp for all the yaml files placed in the app.<br>=C2=A0*=C2=A0 Use generated=
 &quot;elog-errors.hpp&quot; instead of &quot;&lt;phosphor-logging/elog-err=
ors.hpp&gt;&quot;<br>=C2=A0*=C2=A0 Have a follow-up commit that removes &qu=
ot;#include &lt;elog-errors.hpp&gt;&quot; =C2=A0 and add &quot;#include&lt;=
phosphor-logging/elog-errors.hpp&gt;&quot;. <br>=C2=A0*=C2=A0 Remove manual=
ly generated &quot;elog-errors.hpp&quot; file.<br><br></span></font></div><=
font size=3D"4"><span style=3D"font-family:arial,helvetica,sans-serif">Ther=
e could be other issues relating to inhering of errors from DBUS and errors=
 and e.t.c which need to be addressed.<br></span></font><div><div><div><fon=
t size=3D"4"><span style=3D"font-family:arial,helvetica,sans-serif"><br></s=
pan></font></div><div><font size=3D"4"><span style=3D"font-family:arial,hel=
vetica,sans-serif">Regards<br></span></font></div><div><font size=3D"4"><sp=
an style=3D"font-family:arial,helvetica,sans-serif">Devender<br></span></fo=
nt></div><div><div><font size=3D"4"><span style=3D"font-family:arial,helvet=
ica,sans-serif"><br></span></font></div></div></div></div></div>

--f403043e272cfbb13205576c5b71--
