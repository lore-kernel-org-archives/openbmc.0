Return-Path: <mkumatag@in.ibm.com>
Received: from e28smtp09.in.ibm.com (e28smtp09.in.ibm.com [125.16.236.9])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qVskN37ZrzDq5s
 for <openbmc@lists.ozlabs.org>; Thu, 24 Mar 2016 14:44:28 +1100 (AEDT)
Received: from localhost
 by e28smtp09.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mkumatag@in.ibm.com>;
 Thu, 24 Mar 2016 09:14:25 +0530
Received: from d28relay05.in.ibm.com (9.184.220.62)
 by e28smtp09.in.ibm.com (192.168.1.139) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 24 Mar 2016 09:14:23 +0530
X-IBM-Helo: d28relay05.in.ibm.com
X-IBM-MailFrom: mkumatag@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d28relay05.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u2O3hmaS12321078
 for <openbmc@lists.ozlabs.org>; Thu, 24 Mar 2016 09:13:49 +0530
Message-Id: <201603240343.u2O3hmaS12321078@d28relay05.in.ibm.com>
Received: from localhost
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mkumatag@in.ibm.com>;
 Wed, 23 Mar 2016 23:43:00 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.66)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Wed, 23 Mar 2016 23:42:59 -0400
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: mkumatag@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <mkumatag@in.ibm.com>;
 Thu, 24 Mar 2016 03:42:57 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 24 Mar 2016 03:42:55 -0000
Received: from us1a3-mail108.a3.dal06.isc4sb.com ([10.146.45.126])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2016032403425523-5666 ;
 Thu, 24 Mar 2016 03:42:55 +0000 
MIME-Version: 1.0
In-Reply-To: <1458681641-19859-2-git-send-email-openbmc-patches@stwcx.xyz>
Subject: Re: [PATCH openbmc] Limit size of event log db
To: anoo@us.ibm.com
Cc: openbmc@lists.ozlabs.org, OpenBMC Patches <openbmc-patches@stwcx.xyz>
From: "Manjunath A Kumatagi" <mkumatag@in.ibm.com>
Date: Thu, 24 Mar 2016 09:12:38 +0530
References: <1458681641-19859-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1458681641-19859-2-git-send-email-openbmc-patches@stwcx.xyz>
X-KeepSent: 6575610F:87DBA9E1-65257F80:001446AF;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP5 Octobe4, 2013
X-LLNOutbound: False
X-Disclaimed: 46183
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=EABBF513DF87C03F8f9e8a93df938690918cEABBF513DF87C03F"
Content-Disposition: inline
x-cbid: 16032403-0041-0000-0000-00000B581EC5
X-IBM-ISS-SpamDetectors: Score=0.433748; BY=0.034245; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.433748; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005073; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000154; SDB=6.00677774; UDB=6.00310629; UTC=2016-03-24
 03:42:56
x-cbparentid: 16032403-9588-0000-0000-0000029D6153
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
X-List-Received-Date: Thu, 24 Mar 2016 03:44:29 -0000


--0__=EABBF513DF87C03F8f9e8a93df938690918cEABBF513DF87C03F
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


see inline

"openbmc" <openbmc-bounces+mkumatag=3Din.ibm.com@lists.ozlabs.org> wrote on
03/23/2016 02:50:41 AM:

> From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
> To: openbmc@lists.ozlabs.org
> Date: 03/23/2016 02:51 AM
> Subject: [PATCH openbmc] Limit size of event log db
> Sent by: "openbmc" <openbmc-bounces+mkumatag=3Din.ibm.com@lists.ozlabs.or=
g>
>
> From: Adriana Kobylak <anoo@us.ibm.com>
>
> The event log process now supports an argument to specify the max
> size of the event log db. Set this size to a default of 200kB.
>
> Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
> ---
>  .../obmc-phosphor-event/files/obmc-phosphor-event.service             |
2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-
> event/files/obmc-phosphor-event.service b/meta-phosphor/common/
> recipes-phosphor/obmc-phosphor-event/files/obmc-phosphor-event.service
> index 8e0266b..828cb6a 100644
> --- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/
> files/obmc-phosphor-event.service
> +++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/
> files/obmc-phosphor-event.service
> @@ -2,7 +2,7 @@
>  Description=3DPhosphor OpenBMC event management daemon
>
>  [Service]
> -ExecStart=3D/usr/sbin/obmc-phosphor-eventd
> +ExecStart=3D/usr/sbin/obmc-phosphor-eventd -s 200000
IMO we should use EnvironmentFile entry under the service section and read
the option from that file instead of hardcoding the value directly. This
option will even help to change the value runtime and test it.


Reference -
http://fedoraproject.org/wiki/Packaging:Systemd#EnvironmentFiles=5Fand=5Fsu=
pport=5Ffor=5F.2Fetc.2Fsysconfig=5Ffiles

>
>  [Install]
>  WantedBy=3Dmulti-user.target
> --
> 2.7.1
>
>
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--0__=EABBF513DF87C03F8f9e8a93df938690918cEABBF513DF87C03F
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>see inline<br><br><tt>&quot;openbmc&quot; &lt;openbmc-bounce=
s+mkumatag=3Din.ibm.com@lists.ozlabs.org&gt; wrote on 03/23/2016 02:50:41 A=
M:<br><br>&gt; From: OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt;</tt>=
<br><tt>&gt; To: openbmc@lists.ozlabs.org</tt><br><tt>&gt; Date: 03/23/2016=
 02:51 AM</tt><br><tt>&gt; Subject: [PATCH openbmc] Limit size of event log=
 db</tt><br><tt>&gt; Sent by: &quot;openbmc&quot; &lt;openbmc-bounces+mkuma=
tag=3Din.ibm.com@lists.ozlabs.org&gt;</tt><br><tt>&gt; <br>&gt; From: Adria=
na Kobylak &lt;anoo@us.ibm.com&gt;<br>&gt; <br>&gt; The event log process n=
ow supports an argument to specify the max<br>&gt; size of the event log db=
. Set this size to a default of 200kB.<br>&gt; <br>&gt; Signed-off-by: Adri=
ana Kobylak &lt;anoo@us.ibm.com&gt;<br>&gt; ---<br>&gt; &nbsp;.../obmc-phos=
phor-event/files/obmc-phosphor-event.service &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; | 2 +-<br>&gt; &nbsp;1 file changed, 1 insertion(+), 1 deletion=
(-)<br>&gt; <br>&gt; diff --git a/meta-phosphor/common/recipes-phosphor/obm=
c-phosphor-<br>&gt; event/files/obmc-phosphor-event.service b/meta-phosphor=
/common/<br>&gt; recipes-phosphor/obmc-phosphor-event/files/obmc-phosphor-e=
vent.service<br>&gt; index 8e0266b..828cb6a 100644<br>&gt; --- a/meta-phosp=
hor/common/recipes-phosphor/obmc-phosphor-event/<br>&gt; files/obmc-phospho=
r-event.service<br>&gt; +++ b/meta-phosphor/common/recipes-phosphor/obmc-ph=
osphor-event/<br>&gt; files/obmc-phosphor-event.service<br>&gt; @@ -2,7 +2,=
7 @@<br>&gt; &nbsp;Description=3DPhosphor OpenBMC event management daemon<b=
r>&gt; &nbsp;<br>&gt; &nbsp;[Service]<br>&gt; -ExecStart=3D/usr/sbin/obmc-p=
hosphor-eventd<br>&gt; +ExecStart=3D/usr/sbin/obmc-phosphor-eventd -s 20000=
0</tt><br><font size=3D"4">IMO we should use EnvironmentFile entry under th=
e service section and read the option from that file instead of hardcoding =
the value directly. This option will even help to change the value runtime =
and test it.</font><p><font size=3D"4">Reference - </font><a href=3D"http:/=
/fedoraproject.org/wiki/Packaging:Systemd#EnvironmentFiles=5Fand=5Fsupport=
=5Ffor=5F.2Fetc.2Fsysconfig=5Ffiles"><u><font size=3D"4" color=3D"#0000FF">=
http://fedoraproject.org/wiki/Packaging:Systemd#EnvironmentFiles=5Fand=5Fsu=
pport=5Ffor=5F.2Fetc.2Fsysconfig=5Ffiles</font></u></a><tt><br>&gt; &nbsp;<=
br>&gt; &nbsp;[Install]<br>&gt; &nbsp;WantedBy=3Dmulti-user.target<br>&gt; =
-- <br>&gt; 2.7.1<br>&gt; <br>&gt; <br>&gt; =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>&gt; openbmc mailing list<br>&gt; o=
penbmc@lists.ozlabs.org<br>&gt; <a href=3D"https://lists.ozlabs.org/listinf=
o/openbmc">https://lists.ozlabs.org/listinfo/openbmc</a><br></tt><BR>
</body></html>

--0__=EABBF513DF87C03F8f9e8a93df938690918cEABBF513DF87C03F--
