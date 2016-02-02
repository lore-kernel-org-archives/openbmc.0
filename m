Return-Path: <njames@us.ibm.com>
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1F21A0070
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 13:25:36 +1100 (AEDT)
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Mon, 1 Feb 2016 21:25:33 -0500
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 1 Feb 2016 21:25:30 -0500
X-IBM-Helo: d01dlp01.pok.ibm.com
X-IBM-MailFrom: njames@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])
 by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 18FB738C804F
 for <openbmc@lists.ozlabs.org>; Mon,  1 Feb 2016 21:25:30 -0500 (EST)
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u122PUMj29294624
 for <openbmc@lists.ozlabs.org>; Tue, 2 Feb 2016 02:25:30 GMT
Received: from d01av03.pok.ibm.com (localhost [127.0.0.1])
 by d01av03.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u122PTjR016721
 for <openbmc@lists.ozlabs.org>; Mon, 1 Feb 2016 21:25:29 -0500
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d01av03.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u122PSug016677
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 1 Feb 2016 21:25:29 -0500
Message-Id: <201602020225.u122PSug016677@d01av03.pok.ibm.com>
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Mon, 1 Feb 2016 19:25:28 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.90)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Mon, 1 Feb 2016 19:25:26 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: njames@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Tue, 2 Feb 2016 02:25:25 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.100)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 2 Feb 2016 02:25:24 -0000
Received: from us1a3-mail62.a3.dal09.isc4sb.com ([10.142.3.202])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016020202265587-490201 ;
 Tue, 2 Feb 2016 02:26:55 +0000 
In-Reply-To: <CACPK8XcEhamUF3vC2cgb-a4Kwi2DGpn5FZVpcnM-GN7i3Gd-XQ@mail.gmail.com>
Subject: Re: [PATCH openbmc] Update recipes to pick changes for Foxconn build
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
From: "Norman James" <njames@us.ibm.com>
Date: Mon, 1 Feb 2016 20:25:17 -0600
References: <1454371229-4435-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454371229-4435-2-git-send-email-openbmc-patches@stwcx.xyz>
 <CACPK8XcEhamUF3vC2cgb-a4Kwi2DGpn5FZVpcnM-GN7i3Gd-XQ@mail.gmail.com>
X-KeepSent: 2CD4F1F9:EED3177E-86257F4D:000D1043;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP2 SHF37 August 25, 2014
X-LLNOutbound: False
X-Disclaimed: 55127
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=09BBF5DEDF9E96D38f9e8a93df938690918c09BBF5DEDF9E96D3"
x-cbid: 16020202-0045-0000-0000-000003365DEE
X-IBM-ISS-SpamDetectors: Score=0.410717; BY=0.132783; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004867; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000138; SDB=6.00653928; UDB=6.00296232; UTC=2016-02-02
 02:25:25
x-cbparentid: 16020202-7792-0000-0000-000001CC9C8D
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
X-List-Received-Date: Tue, 02 Feb 2016 02:25:37 -0000

--0__=09BBF5DEDF9E96D38f9e8a93df938690918c09BBF5DEDF9E96D3
Content-type: multipart/alternative; 
	Boundary="1__=09BBF5DEDF9E96D38f9e8a93df938690918c09BBF5DEDF9E96D3"


--1__=09BBF5DEDF9E96D38f9e8a93df938690918c09BBF5DEDF9E96D3
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


When are you doing a release?   OCC is broken in current kernel release.


Regards,
Norman James
IBM - POWER Systems Architect
Phone: 1-512-286-6807 (T/L: 363-6807)
Internet: njames@us.ibm.com




From:	Joel Stanley <joel@jms.id.au>
To:	OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc:	OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date:	02/01/2016 07:13 PM
Subject:	Re: [PATCH openbmc] Update recipes to pick changes for Foxconn
            build
Sent by:	"openbmc" <openbmc-bounces+njames=3Dus.ibm.com@lists.ozlabs.org>



On Tue, Feb 2, 2016 at 10:30 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
>
> Update recipes to pick up changes required for Foxconn delivery
> ---
>  meta-phosphor/common/recipes-kernel/linux/linux-obmc=5F4.3.bb        | 2
+-
>  meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb | 2
+-
>  meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb     | 2
+-
>  meta-phosphor/common/recipes-phosphor/settings/settings.bb         | 2
+-
>  meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb         | 2
+-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc=5F4.3.bb
b/meta-phosphor/common/recipes-kernel/linux/linux-obmc=5F4.3.bb
> index 3b1eec8..13887e6 100644
> --- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc=5F4.3.bb
> +++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc=5F4.3.bb
> @@ -10,7 +10,7 @@ SRC=5FURI =3D
"git://github.com/openbmc/linux;protocol=3Dgit;branch=3D${KBRANCH}"
>  LINUX=5FVERSION ?=3D "4.3"
>  LINUX=5FVERSION=5FEXTENSION ?=3D "-${SRCREV}"
>
> -SRCREV=3D"openbmc-20160127-1"
> +SRCREV=3D"7fbee5252ddea512c208727377de7df5968ee8f1"

This is not how we do the kernel releases. Please do not merge this.

Regards,

Joel
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc


--1__=09BBF5DEDF9E96D38f9e8a93df938690918c09BBF5DEDF9E96D3
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>When are you doing a release?   OCC is broken in current ker=
nel release.<br><br><br>Regards,<br>Norman James<br>IBM - POWER Systems Arc=
hitect<br>Phone: 1-512-286-6807 (T/L: 363-6807)<br>Internet: njames@us.ibm.=
com<br><br><br><img width=3D"16" height=3D"16" src=3D"cid:1=5F=5F=3D09BBF5D=
EDF9E96D38f9e8a93df938690918c09B@" border=3D"0" alt=3D"Inactive hide detail=
s for Joel Stanley ---02/01/2016 07:13:40 PM---On Tue, Feb 2, 2016 at 10:30=
 AM, OpenBMC Patches &lt;openbmc-pa"><font color=3D"#424282">Joel Stanley -=
--02/01/2016 07:13:40 PM---On Tue, Feb 2, 2016 at 10:30 AM, OpenBMC Patches=
 &lt;openbmc-patches@stwcx.xyz&gt; wrote:</font><br><br><font size=3D"2" co=
lor=3D"#5F5F5F">From:        </font><font size=3D"2">Joel Stanley &lt;joel@=
jms.id.au&gt;</font><br><font size=3D"2" color=3D"#5F5F5F">To:        </fon=
t><font size=3D"2">OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt;</font>=
<br><font size=3D"2" color=3D"#5F5F5F">Cc:        </font><font size=3D"2">O=
penBMC Maillist &lt;openbmc@lists.ozlabs.org&gt;</font><br><font size=3D"2"=
 color=3D"#5F5F5F">Date:        </font><font size=3D"2">02/01/2016 07:13 PM=
</font><br><font size=3D"2" color=3D"#5F5F5F">Subject:        </font><font =
size=3D"2">Re: [PATCH openbmc] Update recipes to pick changes for Foxconn b=
uild</font><br><font size=3D"2" color=3D"#5F5F5F">Sent by:        </font><f=
ont size=3D"2">&quot;openbmc&quot; &lt;openbmc-bounces+njames=3Dus.ibm.com@=
lists.ozlabs.org&gt;</font><br><hr width=3D"100%" size=3D"2" align=3D"left"=
 noshade style=3D"color:#8091A5; "><br><br><br><tt>On Tue, Feb 2, 2016 at 1=
0:30 AM, OpenBMC Patches<br>&lt;openbmc-patches@stwcx.xyz&gt; wrote:<br>&gt=
; From: Adriana Kobylak &lt;anoo@us.ibm.com&gt;<br>&gt;<br>&gt; Update reci=
pes to pick up changes required for Foxconn delivery<br>&gt; ---<br>&gt; &n=
bsp;meta-phosphor/common/recipes-kernel/linux/linux-obmc=5F4.3.bb &nbsp; &n=
bsp; &nbsp; &nbsp;| 2 +-<br>&gt; &nbsp;meta-phosphor/common/recipes-phospho=
r/host-ipmid/host-ipmid-fru.bb | 2 +-<br>&gt; &nbsp;meta-phosphor/common/re=
cipes-phosphor/host-ipmid/host-ipmid.bb &nbsp; &nbsp; | 2 +-<br>&gt; &nbsp;=
meta-phosphor/common/recipes-phosphor/settings/settings.bb &nbsp; &nbsp; &n=
bsp; &nbsp; | 2 +-<br>&gt; &nbsp;meta-phosphor/common/recipes-phosphor/skel=
eton/skeleton.bb &nbsp; &nbsp; &nbsp; &nbsp; | 2 +-<br>&gt; &nbsp;5 files c=
hanged, 5 insertions(+), 5 deletions(-)<br>&gt;<br>&gt; diff --git a/meta-p=
hosphor/common/recipes-kernel/linux/linux-obmc=5F4.3.bb b/meta-phosphor/com=
mon/recipes-kernel/linux/linux-obmc=5F4.3.bb<br>&gt; index 3b1eec8..13887e6=
 100644<br>&gt; --- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc=
=5F4.3.bb<br>&gt; +++ b/meta-phosphor/common/recipes-kernel/linux/linux-obm=
c=5F4.3.bb<br>&gt; @@ -10,7 +10,7 @@ SRC=5FURI =3D &quot;git://github.com/o=
penbmc/linux;protocol=3Dgit;branch=3D${KBRANCH}&quot;<br>&gt; &nbsp;LINUX=
=5FVERSION ?=3D &quot;4.3&quot;<br>&gt; &nbsp;LINUX=5FVERSION=5FEXTENSION ?=
=3D &quot;-${SRCREV}&quot;<br>&gt;<br>&gt; -SRCREV=3D&quot;openbmc-20160127=
-1&quot;<br>&gt; +SRCREV=3D&quot;7fbee5252ddea512c208727377de7df5968ee8f1&q=
uot;<br><br>This is not how we do the kernel releases. Please do not merge =
this.<br><br>Regards,<br><br>Joel<br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc mailing list<br>openbmc@lists.ozl=
abs.org<br></tt><tt><a href=3D"https://lists.ozlabs.org/listinfo/openbmc">h=
ttps://lists.ozlabs.org/listinfo/openbmc</a></tt><tt><br></tt><br><BR>
</body></html>

--1__=09BBF5DEDF9E96D38f9e8a93df938690918c09BBF5DEDF9E96D3--


--0__=09BBF5DEDF9E96D38f9e8a93df938690918c09BBF5DEDF9E96D3
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=09BBF5DEDF9E96D38f9e8a93df938690918c09B@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=09BBF5DEDF9E96D38f9e8a93df938690918c09BBF5DEDF9E96D3--
