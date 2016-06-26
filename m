Return-Path: <miltonm@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rcXZT59y2zDqm7
 for <openbmc@lists.ozlabs.org>; Sun, 26 Jun 2016 10:12:33 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u5Q092Rb025584
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 20:12:31 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 23sm9c9yfg-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 20:12:31 -0400
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Sat, 25 Jun 2016 20:12:30 -0400
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sat, 25 Jun 2016 20:12:28 -0400
X-IBM-Helo: d01dlp02.pok.ibm.com
X-IBM-MailFrom: miltonm@us.ibm.com
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 443EC6E803C
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 20:12:10 -0400 (EDT)
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5Q0CSVC60489900
 for <openbmc@lists.ozlabs.org>; Sun, 26 Jun 2016 00:12:28 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43B1511206F
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 20:12:28 -0400 (EDT)
Received: from d50lp31.co.us.ibm.com (unknown [9.17.249.32])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS id F286D112073
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 20:12:27 -0400 (EDT)
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Sat, 25 Jun 2016 18:12:27 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.90)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Sat, 25 Jun 2016 18:12:24 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: miltonm@us.ibm.com
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Sun, 26 Jun 2016 00:12:23 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Sun, 26 Jun 2016 00:12:22 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2016062600122201-185867 ;
 Sun, 26 Jun 2016 00:12:22 +0000 
In-Reply-To: <1466663149.23740.88.camel@aj.id.au>
Subject: Re: [PATCH openbmc v6 17/18] initfs: update: Sanitze whitelist
 directory entries
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Sun, 26 Jun 2016 00:12:22 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <1466663149.23740.88.camel@aj.id.au>,
 <20160623003038.2361-1-openbmc-patches@stwcx.xyz>
 <20160623003038.2361-18-openbmc-patches@stwcx.xyz>
X-Mailer: Lotus Domino Web Server Build V851SAAS_06062016_FP3.1 June 14, 2016
X-LLNOutbound: False
X-Disclaimed: 49411
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16062600-0056-0000-0000-0000009F5F2F
X-IBM-ISS-SpamDetectors: Score=0.410169; BY=0.034406; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.410169; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005430; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000170; SDB=6.00721549; UDB=6.00336905; UTC=2016-06-26
 00:12:23
x-cbparentid: 16062600-7792-0000-0000-0000043F86C9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF8047CD3F.A7CFD5BB-ON00257FDD.00802FDC-00257FDE.000121F4@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-06-25_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=2
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1606260001
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Jun 2016 00:12:34 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2"><br>On 06/23/2016 about 01:26AM in some time zone, Andrew Jeffery wr=
ote:<br>&gt;On Wed, 2016-06-22 at 19:30 -0500, OpenBMC Patches wrote:<br>&g=
t;&gt; From: Milton Miller &lt;<a target=3D"=5Fblank" href=3D"mailto:milton=
m@us.ibm.com">miltonm@us.ibm.com</a>&gt;<br>&gt;&gt; <br>&gt;&gt; Repeatedl=
y strip trailing / and /. from whitelist entries and<br>&gt;&gt; fail if an=
 entry includes /../ or ends with /.. or doesn't start<br>&gt;&gt; with a /=
.&nbsp;&nbsp;Also use the entries quoted to avoid any glob.<br>&gt;<br>&gt;=
Right. Ending this particular sentence with a '/' is a bit subtle. I<br>&gt=
;think you should quote your path bits: "/", "/.", "/../", "/.."; this<br>&=
gt;way the sentence would end '... or doesn't start with a "/".'.<br><br>Ok=
 done.<br><br>&gt;&gt; <br>&gt;&gt; It was noticed the save code was saving=
 directories that ended in /<br>&gt;&gt; into a subdirectory of the last co=
mponent name.&nbsp;&nbsp;This was traced<br>&gt;&gt; the the code creating =
the directory just stripping the last /<br>&gt;&gt; and then copying to the=
 directory.<br>&gt;&gt; <br>&gt;&gt; Choose to sanitize the entry where pos=
sible for ease of use verses<br>&gt;&gt; a small performance penality.<br>&=
gt;&gt; <br>&gt;&gt; Signed-off-by: Milton Miller &lt;<a target=3D"=5Fblank=
" href=3D"mailto:miltonm@us.ibm.com">miltonm@us.ibm.com</a>&gt;<br>&gt;&gt;=
 ---<br>&gt;&gt; &nbsp;.../obmc-phosphor-initfs/files/obmc-update.sh&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 15=
<br>&gt;+++++++++++++--<br>&gt;&gt; &nbsp;1 file changed, 13 insertions(+),=
 2 deletions(-)<br>&gt;&gt; <br>&gt;&gt; diff --git<br>&gt;a/meta-phosphor/=
common/recipes-phosphor/obmc-phosphor-initfs/files/ob<br>&gt;mc-update.sh<b=
r>&gt;b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob=
<br>&gt;mc-update.sh<br>&gt;&gt; index 7120a18..bfacd00 100755<br>&gt;&gt; =
---<br>&gt;a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/fil=
es/ob<br>&gt;mc-update.sh<br>&gt;&gt; +++<br>&gt;b/meta-phosphor/common/rec=
ipes-phosphor/obmc-phosphor-initfs/files/ob<br>&gt;mc-update.sh<br>&gt;&gt;=
 @@ -170,13 +170,24 @@ then<br>&gt;&gt; &nbsp;<br>&gt;&gt; &nbsp;        wh=
ile read f<br>&gt;&gt; &nbsp;        do<br>&gt;&gt; -                if ! t=
est -e $upper/$f<br>&gt;&gt; +                # Entries shall start with /,=
 no trailing /.. or embedded /../<br>&gt;&gt; +                if test "/${=
f#/}" !=3D "$f" -o "${f%/..}" !=3D "${f#*/../}"<br>&gt;<br>&gt;Can we do th=
is with `readlink -f` or `realpath` instead? Do we have<br>&gt;them availab=
le in this environment? As in, test that the result<br>&gt;before<br>&gt;an=
d after realpath are the same. You can tell realpath to not expand<br>&gt;s=
ymlinks.<br>&gt;<br><br>ENODOC<br><br>There does not appear to be a man pag=
e available for realpath(1)<br>in either Debian wheezy or RHEL 6.4.&nbsp; T=
he man page for readlink<br>is talking about expanding symlinks with -f say=
ing it follows symlinks<br>recursively, no where does it talk about cleanin=
g up the path, nor<br>returning the path of something not a symlink.<br><br=
>A qucik search turned up [1] which shows some of the history.&nbsp; <br>Al=
so note it says busybox (which is the version we are using) <br>does not ta=
ke options in its realpath command.<br><br>Also this is already peaking und=
er the covers at the read-write <br>COW directory which is a sparse copy an=
d not looking though <br>the combined file system.&nbsp; And this file subt=
ree is not mounted <br>at / meaning any attempt to follow an absolute symli=
nk will likely <br>find the wrong content and not necessarily fail.<br><br>=
So I am rejecting this suggestion.<br><br>[1] <a target=3D"=5Fblank" href=
=3D"http://unix.stackexchange.com/questions/136494/whats-the-difference-bet=
ween-realpath-and-readlink-f">http://unix.stackexchange.com/questions/13649=
4/whats-the-difference-between-realpath-and-readlink-f</a><br><br>&gt;&gt; =
+                then<br>&gt;&gt; +                        echo 1&gt;&amp;2=
 "WARNING: Skipping bad whitelist entry $f."<br>&gt;&gt; +                 =
       continue<br>&gt;&gt; +                fi<br>&gt;&gt; +              =
  if ! test -e "$upper/$f"<br>&gt;&gt; &nbsp;                then<br>&gt;&g=
t; &nbsp;                        continue<br>&gt;&gt; &nbsp;               =
 fi<br>&gt;&gt; &nbsp;                d=3D"$save/$f"<br>&gt;&gt; +         =
       while test "${d%/}" !=3D "${d%/.}"<br>&gt;&gt; +                do<b=
r>&gt;&gt; +                        d=3D"${d%/.}"<br>&gt;&gt; +            =
            d=3D"${d%/}"<br>&gt;&gt; +                done<br>&gt;&gt; &nbs=
p;                mkdir -p "${d%/*}"<br>&gt;&gt; -                cp -rp $u=
pper/$f "${d%/*}/"<br>&gt;&gt; +                cp -rp "$upper/$f" "${d%/*}=
/"<br>&gt;<br>&gt;Again the while loop and other bits can hopefully be repl=
aced by<br>&gt;`readlink -f` or `realpath`. The whole trailing-slash thing =
with `cp`<br>&gt;always throws me.<br><br>While the test here for $d is abs=
olute I'd rather not do it.&nbsp; And <br>right now this has at least two /=
 (one in the string and one leading <br>the $f) meaning a simple equality c=
heck of $d and $(realpath $d) <br>will always fail.&nbsp; I could remove th=
e slash but that implies the <br>first check, and again we are copying from=
 a sparse directory and <br>want to copy a symlink not resolve it.&nbsp;&nb=
sp; I'd love to use rsync here <br>but that is not currently available.<br>=
<br>If you object to the while loop I can reject the path if the conditions=
 <br>on $f with similar substitutions are not equal (reordering the fix<br>=
commit). I don't anticipate the loop executing more than once<br>unless som=
eone is testing corner cases and thought the convenience <br>of making the =
entry sane was better than the debug why the entry<br>didn't work.<br><br>R=
egarding the trailing / on cp, yes it gets me to and I always have<br>to co=
nfirm its working.&nbsp; But I did that for this script once.<br><br>milton=
</font><BR>
