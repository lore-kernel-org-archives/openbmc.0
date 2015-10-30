Return-Path: <njames@us.ibm.com>
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1D12C1A0E8D
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2015 09:14:44 +1100 (AEDT)
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Fri, 30 Oct 2015 18:14:42 -0400
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 30 Oct 2015 18:14:40 -0400
X-IBM-Helo: d01dlp01.pok.ibm.com
X-IBM-MailFrom: njames@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])
 by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 45B8738C8039
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 18:14:39 -0400 (EDT)
Received: from d01av05.pok.ibm.com (d01av05.pok.ibm.com [9.56.224.195])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 t9UMEdtj58589296
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 22:14:39 GMT
Received: from d01av05.pok.ibm.com (localhost [127.0.0.1])
 by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t9UMDYIg018247
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 18:13:34 -0400
Received: from d50lp01.ny.us.ibm.com (d50lp01.pok.ibm.com [146.89.104.207])
 by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 t9UMDXra018222
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 18:13:33 -0400
Message-Id: <201510302213.t9UMDXra018222@d01av05.pok.ibm.com>
Received: from /spool/local
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Fri, 30 Oct 2015 18:14:37 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.91)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Fri, 30 Oct 2015 18:14:35 -0400
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Fri, 30 Oct 2015 22:14:34 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.103)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 30 Oct 2015 22:14:31 -0000
Received: from us1a3-mail62.a3.dal09.isc4sb.com ([10.142.3.202])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2015103022144321-572065 ;
 Fri, 30 Oct 2015 22:14:43 +0000 
In-Reply-To: <20151030193439.GJ31364@asimov.austin.ibm.com>
Subject: Re: [PATCH linux] added i2c busses and devices for palmetto and
 barreleye
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC Patches <patches@stwcx.xyz>, openbmc@lists.ozlabs.org
From: "Norman James" <njames@us.ibm.com>
Date: Fri, 30 Oct 2015 16:07:44 -0600
References: <1446231145-31066-1-git-send-email-patches@stwcx.xyz>
 <20151030193439.GJ31364@asimov.austin.ibm.com>
X-KeepSent: 780D3523:C1ADA8E5-86257EEE:00798767;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP2 SHF37 August 25, 2014
X-LLNOutbound: False
X-Disclaimed: 64855
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=09BBF47DDFEA01F78f9e8a93df938690918c09BBF47DDFEA01F7"
x-cbid: 15103022-0045-0000-0000-0000021B074F
X-IBM-ISS-SpamDetectors: Score=0.410717; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004551; HX=3.00000236; KW=3.00000007;
 PH=3.00000004; SC=3.00000120; SDB=6.00610349; UDB=6.00269444; UTC=2015-10-30
 22:14:33
x-cbparentid: 15103022-4778-0000-0000-000000ACEFD8
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
X-List-Received-Date: Fri, 30 Oct 2015 22:14:45 -0000

--0__=09BBF47DDFEA01F78f9e8a93df938690918c09BBF47DDFEA01F7
Content-type: multipart/alternative; 
	Boundary="1__=09BBF47DDFEA01F78f9e8a93df938690918c09BBF47DDFEA01F7"


--1__=09BBF47DDFEA01F78f9e8a93df938690918c09BBF47DDFEA01F7
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


Fine with me.


Regards,
Norman James
IBM - POWER Systems Architect
Phone: 1-512-286-6807 (T/L: 363-6807)
Internet: njames@us.ibm.com




From:	Patrick Williams <patrick@stwcx.xyz>
To:	OpenBMC Patches <patches@stwcx.xyz>
Cc:	openbmc@lists.ozlabs.org
Date:	10/30/2015 02:34 PM
Subject:	Re: [PATCH linux] added i2c busses and devices for palmetto and
            barreleye
Sent by:	"openbmc" <openbmc-bounces+njames=3Dus.ibm.com@lists.ozlabs.org>



On Fri, Oct 30, 2015 at 01:52:24PM -0500, OpenBMC Patches wrote:
> i'm not sure compatibility string is correct for barreleye
>
> https://github.com/openbmc/linux/pull/10
>
> Norman James (1):
>   added i2c busses and devices
>
>  arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 333 +++++++++++++++++++
++++++
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts  |  28 ++-
>  2 files changed, 354 insertions(+), 7 deletions(-)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
>
> --
> 2.6.0
>
>
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

In general where should we put the devtree files?  Seems like these
belong in meta-phosphor-machines instead of directly in the linux tree.

If there is no disagreement I can open an issue to track moving these.
--
Patrick Williams
[attachment "signature.asc" deleted by Norman James/Austin/IBM]
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc


--1__=09BBF47DDFEA01F78f9e8a93df938690918c09BBF47DDFEA01F7
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>Fine with me.<br><br><br>Regards,<br>Norman James<br>IBM - P=
OWER Systems Architect<br>Phone: 1-512-286-6807 (T/L: 363-6807)<br>Internet=
: njames@us.ibm.com<br><br><br><img width=3D"16" height=3D"16" src=3D"cid:1=
=5F=5F=3D09BBF47DDFEA01F78f9e8a93df938690918c09B@" border=3D"0" alt=3D"Inac=
tive hide details for Patrick Williams ---10/30/2015 02:34:55 PM---On Fri, =
Oct 30, 2015 at 01:52:24PM -0500, OpenBMC Patche"><font color=3D"#424282">P=
atrick Williams ---10/30/2015 02:34:55 PM---On Fri, Oct 30, 2015 at 01:52:2=
4PM -0500, OpenBMC Patches wrote: &gt; i'm not sure compatibility string</f=
ont><br><br><font size=3D"2" color=3D"#5F5F5F">From:        </font><font si=
ze=3D"2">Patrick Williams &lt;patrick@stwcx.xyz&gt;</font><br><font size=3D=
"2" color=3D"#5F5F5F">To:        </font><font size=3D"2">OpenBMC Patches &l=
t;patches@stwcx.xyz&gt;</font><br><font size=3D"2" color=3D"#5F5F5F">Cc:   =
     </font><font size=3D"2">openbmc@lists.ozlabs.org</font><br><font size=
=3D"2" color=3D"#5F5F5F">Date:        </font><font size=3D"2">10/30/2015 02=
:34 PM</font><br><font size=3D"2" color=3D"#5F5F5F">Subject:        </font>=
<font size=3D"2">Re: [PATCH linux] added i2c busses and devices for palmett=
o and barreleye</font><br><font size=3D"2" color=3D"#5F5F5F">Sent by:      =
  </font><font size=3D"2">&quot;openbmc&quot; &lt;openbmc-bounces+njames=3D=
us.ibm.com@lists.ozlabs.org&gt;</font><br><hr width=3D"100%" size=3D"2" ali=
gn=3D"left" noshade style=3D"color:#8091A5; "><br><br><br><tt>On Fri, Oct 3=
0, 2015 at 01:52:24PM -0500, OpenBMC Patches wrote:<br>&gt; i'm not sure co=
mpatibility string is correct for barreleye<br>&gt; <br>&gt; </tt><tt><a hr=
ef=3D"https://github.com/openbmc/linux/pull/10">https://github.com/openbmc/=
linux/pull/10</a></tt><tt><br>&gt; <br>&gt; Norman James (1):<br>&gt; &nbsp=
; added i2c busses and devices<br>&gt; <br>&gt; &nbsp;arch/arm/boot/dts/asp=
eed-bmc-opp-barreleye.dts | 333 +++++++++++++++++++++++++<br>&gt; &nbsp;arc=
h/arm/boot/dts/aspeed-bmc-opp-palmetto.dts &nbsp;| &nbsp;28 ++-<br>&gt; &nb=
sp;2 files changed, 354 insertions(+), 7 deletions(-)<br>&gt; &nbsp;create =
mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts<br>&gt; <br>&gt;=
 -- <br>&gt; 2.6.0<br>&gt; <br>&gt; <br>&gt; =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>&gt; openbmc mailing list<br>&gt; o=
penbmc@lists.ozlabs.org<br>&gt; </tt><tt><a href=3D"https://lists.ozlabs.or=
g/listinfo/openbmc">https://lists.ozlabs.org/listinfo/openbmc</a></tt><tt><=
br><br>In general where should we put the devtree files? &nbsp;Seems like t=
hese<br>belong in meta-phosphor-machines instead of directly in the linux t=
ree.<br><br>If there is no disagreement I can open an issue to track moving=
 these.<br>-- <br>Patrick Williams<br>[attachment &quot;signature.asc&quot;=
 deleted by Norman James/Austin/IBM] =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc mailing list<br>openbmc@lists.ozl=
abs.org<br></tt><tt><a href=3D"https://lists.ozlabs.org/listinfo/openbmc">h=
ttps://lists.ozlabs.org/listinfo/openbmc</a></tt><tt><br></tt><br><BR>
</body></html>

--1__=09BBF47DDFEA01F78f9e8a93df938690918c09BBF47DDFEA01F7--


--0__=09BBF47DDFEA01F78f9e8a93df938690918c09BBF47DDFEA01F7
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=09BBF47DDFEA01F78f9e8a93df938690918c09B@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=09BBF47DDFEA01F78f9e8a93df938690918c09BBF47DDFEA01F7--
