Return-Path: <mkumatag@in.ibm.com>
Received: from e28smtp03.in.ibm.com (e28smtp03.in.ibm.com [125.16.236.3])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id EEF491A0D83
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 20:37:11 +1100 (AEDT)
Received: from localhost
 by e28smtp03.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mkumatag@in.ibm.com>;
 Tue, 12 Jan 2016 15:07:08 +0530
Received: from d28dlp01.in.ibm.com (9.184.220.126)
 by e28smtp03.in.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 12 Jan 2016 15:07:06 +0530
X-IBM-Helo: d28dlp01.in.ibm.com
X-IBM-MailFrom: mkumatag@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d28relay02.in.ibm.com (d28relay02.in.ibm.com [9.184.220.59])
 by d28dlp01.in.ibm.com (Postfix) with ESMTP id C5D74E0068
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 15:07:52 +0530 (IST)
Received: from d28av06.in.ibm.com (d28av06.in.ibm.com [9.184.220.48])
 by d28relay02.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0C9aJcT17957044
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 15:06:19 +0530
Received: from d28av06.in.ibm.com (localhost [127.0.0.1])
 by d28av06.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0C9aJIG000963
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 15:06:19 +0530
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d28av06.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u0C9aFdW000730
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 15:06:18 +0530
Message-Id: <201601120936.u0C9aFdW000730@d28av06.in.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mkumatag@in.ibm.com>;
 Tue, 12 Jan 2016 02:36:15 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 12 Jan 2016 02:36:12 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: mkumatag@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <mkumatag@in.ibm.com>;
 Tue, 12 Jan 2016 09:36:11 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 12 Jan 2016 09:36:08 -0000
Received: from us1a3-mail108.a3.dal06.isc4sb.com ([10.146.45.126])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2016011209360725-107901 ;
 Tue, 12 Jan 2016 09:36:07 +0000 
In-Reply-To: <20160112111038.0915e033@camb691>
Subject: Re: [PATCH openbmc-test-automation 00/60] Pull Manjunath's automation
 repository
To: Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
From: "Manjunath A Kumatagi" <mkumatag@in.ibm.com>
Date: Tue, 12 Jan 2016 15:05:56 +0530
References: <1452531026-13715-1-git-send-email-openbmc-patches@stwcx.xyz>
 <20160112111038.0915e033@camb691>
X-KeepSent: EB0431E9:C01DA08F-65257F38:00343C5E;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP5 Octobe4, 2013
X-LLNOutbound: False
X-Disclaimed: 46831
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=EABBF5ABDFA7BACE8f9e8a93df938690918cEABBF5ABDFA7BACE"
x-cbid: 16011209-0009-0000-0000-000009E7D902
X-IBM-ISS-SpamDetectors: Score=0.410717; BY=0.133433; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004778; HX=3.00000239; KW=3.00000007;
 PH=3.00000004; SC=3.00000131; SDB=6.00644132; UDB=6.00290366; UTC=2016-01-12
 09:36:09
x-cbparentid: 16011209-9900-0000-0000-000005A204FB
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jan 2016 09:37:12 -0000

--0__=EABBF5ABDFA7BACE8f9e8a93df938690918cEABBF5ABDFA7BACE
Content-type: multipart/alternative; 
	Boundary="1__=EABBF5ABDFA7BACE8f9e8a93df938690918cEABBF5ABDFA7BACE"


--1__=EABBF5ABDFA7BACE8f9e8a93df938690918cEABBF5ABDFA7BACE
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


These code changes are done long back in my private repository, now part of
mirroring process into openbmc org - we are seeing all of these big list of
commits again in the PR. However all points mention below are very valid
observation and I'll make sure to follow those guidelines going forward.

Thanks,
Manjunath.


From:	Cyril Bur <cyrilbur@gmail.com>
To:	OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc:	openbmc@lists.ozlabs.org
Date:	01/12/2016 05:41 AM
Subject:	Re: [PATCH openbmc-test-automation 00/60] Pull Manjunath's
            automation repository
Sent by:	"openbmc" <openbmc-bounces
            +mkumatag=3Din.ibm.com@lists.ozlabs.org>



On Mon, 11 Jan 2016 10:49:26 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> Pull Manjunath's repository:
https://github.com/mkumatag/openbmc-automation
> into openbmc.
>

Ummmm what happened here? It looks like the entire series is sent twice?

I've had an initial skim read and it looks to me like you can squash A LOT
of
those patches together.

The commits don't need to be a story of how you got from no code to the
this point in time. Each commit should add a feature and associated
documentation. It looks like most of patches 0-6 can be one commit, same
for
some subsequent patches.

Heres an example of some issues I've noticed:

In patch 2 you add tests/test=5Fssh.robot but then in patch 7 you delete
tests/test=5Fssh.robot. There are several examples of a patch adding a
significant chunk of work and then a later patch removing this chunk of
work, if
after the series the chunk of work won't be in the repo then it shouldn't
have
appeared in the series at all.

Patch 26 "Fix errors" should be squashed into the broken commit. Patch 22
looks
that way too and Patch 17. The reason we do this is that way when something
does go wrong and something doesn't work it makes it much easier to find
the
broken patch, you should never submit a patches that is broken even if it
is
fixed directly after this breaks the assumption that every commit we make
is
good and therefore when chasing a bug if a broken patch is found, is it
likely
to be that bug, much easier to automate.

Your patch 28 that "Adds one more ssl test" should be squashed into the
patch
adding the ssl tests, add them all once for this series. You can always
more
work on more later but this series you have one patch adding ssl tests,
have
all the ssl tests you're adding in that patch.

Hopefully that makes sense, please ask if I've just rambled!

Cyril

> https://github.com/openbmc/openbmc-test-automation/pull/1
>
> Chris Austen (16):
>   Added DIMM specific inventory tests
>   base add for sensor tests
>   fixed review comments
>   created loops for tests
>   Add initial rest test cases     Support to test Null properties
>   Added full sensor suite
>   Update README.md
>   Handle new rest client from Brad
>   Added DIMM specific inventory tests
>   base add for sensor tests
>   fixed review comments
>   created loops for tests
>   Add initial rest test cases     Support to test Null properties
>   Added full sensor suite
>   Update README.md
>   Handle new rest client from Brad
>
> Manjunath A Kumatagi (34):
>   Added git ignore file
>   Use argumnet file with pyrobot and added instructions to READEME file.
>   Update README for better html display
>   Added Inventory list testcase
>   fixed errors in tox and generate=5Fargumentfile.sh script
>   Moved Read Attribute and Read Properties to rest=5Fclient
>   fix review comment
>   Added SSL tests
>   Ran the tests and fixed errors in SSL tests
>   Modified the doc
>   Added firmware version validation test
>   update readme file with tox version
>   Fix errors
>   Fix Errors in test=5Fobmcrest.robot and removed the empty testcases.
>   Added one more testcase to test non-ssl connection to port 443
>   OpenBMC REST Testing
>   updated the REST API for firmware version
>   Added git ignore file
>   Use argumnet file with pyrobot and added instructions to READEME file.
>   Update README for better html display
>   Added Inventory list testcase
>   fixed errors in tox and generate=5Fargumentfile.sh script
>   Moved Read Attribute and Read Properties to rest=5Fclient
>   fix review comment
>   Added SSL tests
>   Ran the tests and fixed errors in SSL tests
>   Modified the doc
>   Added firmware version validation test
>   update readme file with tox version
>   Fix errors
>   Fix Errors in test=5Fobmcrest.robot and removed the empty testcases.
>   Added one more testcase to test non-ssl connection to port 443
>   OpenBMC REST Testing
>   updated the REST API for firmware version
>
> Manjunath Kumatagi (2):
>   first commit
>   first commit
>
> manjunath (6):
>   added files
>   added log statement
>   added testcase for etc passwd
>   added files
>   added log statement
>   added testcase for etc passwd
>
> mkumatag (2):
>   Update README.md
>   Update README.md
>
>
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc



--1__=EABBF5ABDFA7BACE8f9e8a93df938690918cEABBF5ABDFA7BACE
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>These code changes are done long back in my private reposito=
ry, now part of mirroring process into openbmc org - we are seeing all of t=
hese big list of commits again in the PR. However all points mention below =
are very valid observation and I'll make sure to follow those guidelines go=
ing forward.<br><br>Thanks,<br>Manjunath.<br><img width=3D"16" height=3D"16=
" src=3D"cid:1=5F=5F=3DEABBF5ABDFA7BACE8f9e8a93df938690918cEAB@" border=3D"=
0" alt=3D"Inactive hide details for Cyril Bur ---01/12/2016 05:41:04 AM---O=
n Mon, 11 Jan 2016 10:49:26 -0600 OpenBMC Patches &lt;openbmc-pat"><font co=
lor=3D"#424282">Cyril Bur ---01/12/2016 05:41:04 AM---On Mon, 11 Jan 2016 1=
0:49:26 -0600 OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt; wrote:</fon=
t><br><br><font size=3D"2" color=3D"#5F5F5F">From:        </font><font size=
=3D"2">Cyril Bur &lt;cyrilbur@gmail.com&gt;</font><br><font size=3D"2" colo=
r=3D"#5F5F5F">To:        </font><font size=3D"2">OpenBMC Patches &lt;openbm=
c-patches@stwcx.xyz&gt;</font><br><font size=3D"2" color=3D"#5F5F5F">Cc:   =
     </font><font size=3D"2">openbmc@lists.ozlabs.org</font><br><font size=
=3D"2" color=3D"#5F5F5F">Date:        </font><font size=3D"2">01/12/2016 05=
:41 AM</font><br><font size=3D"2" color=3D"#5F5F5F">Subject:        </font>=
<font size=3D"2">Re: [PATCH openbmc-test-automation 00/60] Pull Manjunath's=
 automation repository</font><br><font size=3D"2" color=3D"#5F5F5F">Sent by=
:        </font><font size=3D"2">&quot;openbmc&quot; &lt;openbmc-bounces+mk=
umatag=3Din.ibm.com@lists.ozlabs.org&gt;</font><br><hr width=3D"100%" size=
=3D"2" align=3D"left" noshade style=3D"color:#8091A5; "><br><br><br><tt>On =
Mon, 11 Jan 2016 10:49:26 -0600<br>OpenBMC Patches &lt;openbmc-patches@stwc=
x.xyz&gt; wrote:<br><br>&gt; Pull Manjunath's repository: </tt><tt><a href=
=3D"https://github.com/mkumatag/openbmc-automation">https://github.com/mkum=
atag/openbmc-automation</a></tt><tt><br>&gt; into openbmc.<br>&gt; <br><br>=
Ummmm what happened here? It looks like the entire series is sent twice?<br=
><br>I've had an initial skim read and it looks to me like you can squash A=
 LOT of<br>those patches together.<br><br>The commits don't need to be a st=
ory of how you got from no code to the<br>this point in time. Each commit s=
hould add a feature and associated<br>documentation. It looks like most of =
patches 0-6 can be one commit, same for<br>some subsequent patches.<br><br>=
Heres an example of some issues I've noticed:<br><br>In patch 2 you add tes=
ts/test=5Fssh.robot but then in patch 7 you delete <br>tests/test=5Fssh.rob=
ot. There are several examples of a patch adding a<br>significant chunk of =
work and then a later patch removing this chunk of work, if<br>after the se=
ries the chunk of work won't be in the repo then it shouldn't have<br>appea=
red in the series at all.<br><br>Patch 26 &quot;Fix errors&quot; should be =
squashed into the broken commit. Patch 22 looks<br>that way too and Patch 1=
7. The reason we do this is that way when something<br>does go wrong and so=
mething doesn't work it makes it much easier to find the<br>broken patch, y=
ou should never submit a patches that is broken even if it is<br>fixed dire=
ctly after this breaks the assumption that every commit we make is<br>good =
and therefore when chasing a bug if a broken patch is found, is it likely<b=
r>to be that bug, much easier to automate.<br><br>Your patch 28 that &quot;=
Adds one more ssl test&quot; should be squashed into the patch<br>adding th=
e ssl tests, add them all once for this series. You can always more<br>work=
 on more later but this series you have one patch adding ssl tests, have<br=
>all the ssl tests you're adding in that patch.<br><br>Hopefully that makes=
 sense, please ask if I've just rambled!<br><br>Cyril<br><br>&gt; </tt><tt>=
<a href=3D"https://github.com/openbmc/openbmc-test-automation/pull/1">https=
://github.com/openbmc/openbmc-test-automation/pull/1</a></tt><tt><br>&gt; <=
br>&gt; Chris Austen (16):<br>&gt; &nbsp; Added DIMM specific inventory tes=
ts<br>&gt; &nbsp; base add for sensor tests<br>&gt; &nbsp; fixed review com=
ments<br>&gt; &nbsp; created loops for tests<br>&gt; &nbsp; Add initial res=
t test cases &nbsp; &nbsp; Support to test Null properties<br>&gt; &nbsp; A=
dded full sensor suite<br>&gt; &nbsp; Update README.md<br>&gt; &nbsp; Handl=
e new rest client from Brad<br>&gt; &nbsp; Added DIMM specific inventory te=
sts<br>&gt; &nbsp; base add for sensor tests<br>&gt; &nbsp; fixed review co=
mments<br>&gt; &nbsp; created loops for tests<br>&gt; &nbsp; Add initial re=
st test cases &nbsp; &nbsp; Support to test Null properties<br>&gt; &nbsp; =
Added full sensor suite<br>&gt; &nbsp; Update README.md<br>&gt; &nbsp; Hand=
le new rest client from Brad<br>&gt; <br>&gt; Manjunath A Kumatagi (34):<br=
>&gt; &nbsp; Added git ignore file<br>&gt; &nbsp; Use argumnet file with py=
robot and added instructions to READEME file.<br>&gt; &nbsp; Update README =
for better html display<br>&gt; &nbsp; Added Inventory list testcase<br>&gt=
; &nbsp; fixed errors in tox and generate=5Fargumentfile.sh script<br>&gt; =
&nbsp; Moved Read Attribute and Read Properties to rest=5Fclient<br>&gt; &n=
bsp; fix review comment<br>&gt; &nbsp; Added SSL tests<br>&gt; &nbsp; Ran t=
he tests and fixed errors in SSL tests<br>&gt; &nbsp; Modified the doc<br>&=
gt; &nbsp; Added firmware version validation test<br>&gt; &nbsp; update rea=
dme file with tox version<br>&gt; &nbsp; Fix errors<br>&gt; &nbsp; Fix Erro=
rs in test=5Fobmcrest.robot and removed the empty testcases.<br>&gt; &nbsp;=
 Added one more testcase to test non-ssl connection to port 443<br>&gt; &nb=
sp; OpenBMC REST Testing<br>&gt; &nbsp; updated the REST API for firmware v=
ersion<br>&gt; &nbsp; Added git ignore file<br>&gt; &nbsp; Use argumnet fil=
e with pyrobot and added instructions to READEME file.<br>&gt; &nbsp; Updat=
e README for better html display<br>&gt; &nbsp; Added Inventory list testca=
se<br>&gt; &nbsp; fixed errors in tox and generate=5Fargumentfile.sh script=
<br>&gt; &nbsp; Moved Read Attribute and Read Properties to rest=5Fclient<b=
r>&gt; &nbsp; fix review comment<br>&gt; &nbsp; Added SSL tests<br>&gt; &nb=
sp; Ran the tests and fixed errors in SSL tests<br>&gt; &nbsp; Modified the=
 doc<br>&gt; &nbsp; Added firmware version validation test<br>&gt; &nbsp; u=
pdate readme file with tox version<br>&gt; &nbsp; Fix errors<br>&gt; &nbsp;=
 Fix Errors in test=5Fobmcrest.robot and removed the empty testcases.<br>&g=
t; &nbsp; Added one more testcase to test non-ssl connection to port 443<br=
>&gt; &nbsp; OpenBMC REST Testing<br>&gt; &nbsp; updated the REST API for f=
irmware version<br>&gt; <br>&gt; Manjunath Kumatagi (2):<br>&gt; &nbsp; fir=
st commit<br>&gt; &nbsp; first commit<br>&gt; <br>&gt; manjunath (6):<br>&g=
t; &nbsp; added files<br>&gt; &nbsp; added log statement<br>&gt; &nbsp; add=
ed testcase for etc passwd<br>&gt; &nbsp; added files<br>&gt; &nbsp; added =
log statement<br>&gt; &nbsp; added testcase for etc passwd<br>&gt; <br>&gt;=
 mkumatag (2):<br>&gt; &nbsp; Update README.md<br>&gt; &nbsp; Update README=
.md<br>&gt; <br>&gt; <br>&gt; =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F<br>&gt; openbmc mailing list<br>&gt; openbmc@lists.oz=
labs.org<br>&gt; </tt><tt><a href=3D"https://lists.ozlabs.org/listinfo/open=
bmc">https://lists.ozlabs.org/listinfo/openbmc</a></tt><tt><br><br>=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc mai=
ling list<br>openbmc@lists.ozlabs.org<br></tt><tt><a href=3D"https://lists.=
ozlabs.org/listinfo/openbmc">https://lists.ozlabs.org/listinfo/openbmc</a><=
/tt><tt><br></tt><br><br><BR>
</body></html>

--1__=EABBF5ABDFA7BACE8f9e8a93df938690918cEABBF5ABDFA7BACE--


--0__=EABBF5ABDFA7BACE8f9e8a93df938690918cEABBF5ABDFA7BACE
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=EABBF5ABDFA7BACE8f9e8a93df938690918cEAB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=EABBF5ABDFA7BACE8f9e8a93df938690918cEABBF5ABDFA7BACE--
