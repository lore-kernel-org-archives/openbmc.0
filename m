Return-Path: <njames@us.ibm.com>
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8812C1A0191
 for <openbmc@lists.ozlabs.org>; Thu,  4 Feb 2016 11:57:24 +1100 (AEDT)
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Wed, 3 Feb 2016 17:57:22 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 3 Feb 2016 17:57:20 -0700
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: njames@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id B3CE61FF0045
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2016 17:45:29 -0700 (MST)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
 ESMTP id u140vJrv28442866
 for <openbmc@lists.ozlabs.org>; Wed, 3 Feb 2016 17:57:19 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])
 by d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u140vJHs007938
 for <openbmc@lists.ozlabs.org>; Wed, 3 Feb 2016 17:57:19 -0700
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u140vIgX007901
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 3 Feb 2016 17:57:18 -0700
Message-Id: <201602040057.u140vIgX007901@d03av05.boulder.ibm.com>
Received: from /spool/local
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Wed, 3 Feb 2016 19:57:18 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.72)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Wed, 3 Feb 2016 19:57:16 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Thu, 4 Feb 2016 00:57:15 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.94)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 4 Feb 2016 00:57:13 -0000
Received: from us1a3-mail62.a3.dal09.isc4sb.com ([10.142.3.202])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016020400582714-476595 ;
 Thu, 4 Feb 2016 00:58:27 +0000 
In-Reply-To: <CACPK8XdtDEeK2+CZe+me87DG+sbMSMkz4f=F35-OUE34pA7ryQ@mail.gmail.com>
Subject: Re: [PATCH phosphor-host-ipmid] Add Set MAC address
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
From: "Norman James" <njames@us.ibm.com>
Date: Wed, 3 Feb 2016 18:51:40 -0600
References: <1454542828-19634-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454542828-19634-2-git-send-email-openbmc-patches@stwcx.xyz>
 <CACPK8XdtDEeK2+CZe+me87DG+sbMSMkz4f=F35-OUE34pA7ryQ@mail.gmail.com>
X-KeepSent: 0F1F198B:90629395-86257F4F:00049F63;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP2 SHF37 August 25, 2014
X-LLNOutbound: False
X-Disclaimed: 5239
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=09BBF5DCDF9719F38f9e8a93df938690918c09BBF5DCDF9719F3"
x-cbid: 16020400-0021-0000-0000-000016B83982
X-IBM-ISS-SpamDetectors: Score=0.410717; BY=0.132511; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004875; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000138; SDB=6.00654848; UDB=6.00296784; UTC=2016-02-04
 00:57:14
x-cbparentid: 16020400-5090-0000-0000-000006F781DA
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
X-List-Received-Date: Thu, 04 Feb 2016 00:57:25 -0000

--0__=09BBF5DCDF9719F38f9e8a93df938690918c09BBF5DCDF9719F3
Content-type: multipart/alternative; 
	Boundary="1__=09BBF5DCDF9719F38f9e8a93df938690918c09BBF5DCDF9719F3"


--1__=09BBF5DCDF9719F38f9e8a93df938690918c09BBF5DCDF9719F3
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


We are late on tagging a release for Rackspace and so pushing through some
final fixes.  We can open an issue to remind us to review later.


Regards,
Norman James
IBM - POWER Systems Architect
Phone: 1-512-286-6807 (T/L: 363-6807)
Internet: njames@us.ibm.com




From:	Joel Stanley <joel@jms.id.au>
To:	OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc:	OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date:	02/03/2016 06:22 PM
Subject:	Re: [PATCH phosphor-host-ipmid] Add Set MAC address
Sent by:	"openbmc" <openbmc-bounces+njames=3Dus.ibm.com@lists.ozlabs.org>



On Thu, Feb 4, 2016 at 10:40 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
>
> Add Set MAC address parameter command

I notice you posted this patch 40 minutes ago, but had already merged
it. That doesn't give much opportunity for review.

> ---
>  transporthandler.C | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/transporthandler.C b/transporthandler.C
> index dac8fe8..c38adea 100644
> --- a/transporthandler.C
> +++ b/transporthandler.C
> @@ -14,6 +14,7 @@
>  #endif
>
>  // OpenBMC System Manager dbus framework
> +extern sd=5Fbus *bus;

Don't use extern.

We have ipmid=5Fget=5Fsd=5Fbus=5Fconnection() to get a pointer to the sd=5F=
bus.

>  const char  *app   =3D  "org.openbmc.NetworkManager";
>  const char  *obj   =3D  "/org/openbmc/NetworkManager/Interface";
>  const char  *ifc   =3D  "org.openbmc.NetworkManager";
> @@ -64,6 +65,37 @@ ipmi=5Fret=5Ft ipmi=5Ftransport=5Fset=5Flan(ipmi=5Fnet=
fn=5Ft netfn,
ipmi=5Fcmd=5Ft cmd,
>      {
>          sprintf(new=5Fipaddr, "%d.%d.%d.%d", reqptr->data[0], reqptr->da=
ta
[1], reqptr->data[2], reqptr->data[3]);
>      }
> +    else if (reqptr->parameter =3D=3D 5) // MAC
> +    {
> +        char                mac[18];
> +        sd=5Fbus=5Fmessage *reply =3D NULL, *m =3D NULL;
> +        sd=5Fbus=5Ferror error =3D SD=5FBUS=5FERROR=5FNULL;
> +        int r =3D 0;

I don't think any of these should be initialised here.

> +
> +        sprintf(mac, "%x:%x:%x:%x:%x:%x",

You want to use snprintf here.

Also, does this work? I would have thought you'd need to do %02x to
ensure leading zeroes are in the string.

> +                reqptr->data[0],
> +                reqptr->data[1],
> +                reqptr->data[2],
> +                reqptr->data[3],
> +                reqptr->data[4],
> +                reqptr->data[5]);
> +
> +        r =3D sd=5Fbus=5Fmessage=5Fnew=5Fmethod=5Fcall
(bus,&m,app,obj,ifc,"SetHwAddress");
> +        if (r < 0) {
> +            fprintf(stderr, "Failed to add method object: %s\n",
strerror(-r));
> +            return -1;
> +        }
> +        r =3D sd=5Fbus=5Fmessage=5Fappend(m, "s", mac);
> +        if (r < 0) {
> +            fprintf(stderr, "Failed to append message data: %s\n",
strerror(-r));
> +            return -1;
> +        }
> +        r =3D sd=5Fbus=5Fcall(bus, m, 0, &error, &reply);
> +        if (r < 0) {
> +            fprintf(stderr, "Failed to call method: %s\n", strerror
(-r));
> +            return -1;
> +        }
> +    }
>      else if (reqptr->parameter =3D=3D 6) // Subnet
>      {
>          sprintf(new=5Fnetmask, "%d.%d.%d.%d", reqptr->data[0], reqptr->
data[1], reqptr->data[2], reqptr->data[3]);
> --
> 2.6.4
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


--1__=09BBF5DCDF9719F38f9e8a93df938690918c09BBF5DCDF9719F3
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>We are late on tagging a release for Rackspace and so pushin=
g through some final fixes.  We can open an issue to remind us to review la=
ter.<br><br><br>Regards,<br>Norman James<br>IBM - POWER Systems Architect<b=
r>Phone: 1-512-286-6807 (T/L: 363-6807)<br>Internet: njames@us.ibm.com<br><=
br><br><img width=3D"16" height=3D"16" src=3D"cid:1=5F=5F=3D09BBF5DCDF9719F=
38f9e8a93df938690918c09B@" border=3D"0" alt=3D"Inactive hide details for Jo=
el Stanley ---02/03/2016 06:22:03 PM---On Thu, Feb 4, 2016 at 10:40 AM, Ope=
nBMC Patches &lt;openbmc-pa"><font color=3D"#424282">Joel Stanley ---02/03/=
2016 06:22:03 PM---On Thu, Feb 4, 2016 at 10:40 AM, OpenBMC Patches &lt;ope=
nbmc-patches@stwcx.xyz&gt; wrote:</font><br><br><font size=3D"2" color=3D"#=
5F5F5F">From:        </font><font size=3D"2">Joel Stanley &lt;joel@jms.id.a=
u&gt;</font><br><font size=3D"2" color=3D"#5F5F5F">To:        </font><font =
size=3D"2">OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt;</font><br><fon=
t size=3D"2" color=3D"#5F5F5F">Cc:        </font><font size=3D"2">OpenBMC M=
aillist &lt;openbmc@lists.ozlabs.org&gt;</font><br><font size=3D"2" color=
=3D"#5F5F5F">Date:        </font><font size=3D"2">02/03/2016 06:22 PM</font=
><br><font size=3D"2" color=3D"#5F5F5F">Subject:        </font><font size=
=3D"2">Re: [PATCH phosphor-host-ipmid] Add Set MAC address</font><br><font =
size=3D"2" color=3D"#5F5F5F">Sent by:        </font><font size=3D"2">&quot;=
openbmc&quot; &lt;openbmc-bounces+njames=3Dus.ibm.com@lists.ozlabs.org&gt;<=
/font><br><hr width=3D"100%" size=3D"2" align=3D"left" noshade style=3D"col=
or:#8091A5; "><br><br><br><tt>On Thu, Feb 4, 2016 at 10:40 AM, OpenBMC Patc=
hes<br>&lt;openbmc-patches@stwcx.xyz&gt; wrote:<br>&gt; From: Adriana Kobyl=
ak &lt;anoo@us.ibm.com&gt;<br>&gt;<br>&gt; Add Set MAC address parameter co=
mmand<br><br>I notice you posted this patch 40 minutes ago, but had already=
 merged<br>it. That doesn't give much opportunity for review.<br><br>&gt; -=
--<br>&gt; &nbsp;transporthandler.C | 32 ++++++++++++++++++++++++++++++++<b=
r>&gt; &nbsp;1 file changed, 32 insertions(+)<br>&gt;<br>&gt; diff --git a/=
transporthandler.C b/transporthandler.C<br>&gt; index dac8fe8..c38adea 1006=
44<br>&gt; --- a/transporthandler.C<br>&gt; +++ b/transporthandler.C<br>&gt=
; @@ -14,6 +14,7 @@<br>&gt; &nbsp;#endif<br>&gt;<br>&gt; &nbsp;// OpenBMC S=
ystem Manager dbus framework<br>&gt; +extern sd=5Fbus *bus;<br><br>Don't us=
e extern.<br><br>We have ipmid=5Fget=5Fsd=5Fbus=5Fconnection() to get a poi=
nter to the sd=5Fbus.<br><br>&gt; &nbsp;const char &nbsp;*app &nbsp; =3D &n=
bsp;&quot;org.openbmc.NetworkManager&quot;;<br>&gt; &nbsp;const char &nbsp;=
*obj &nbsp; =3D &nbsp;&quot;/org/openbmc/NetworkManager/Interface&quot;;<br=
>&gt; &nbsp;const char &nbsp;*ifc &nbsp; =3D &nbsp;&quot;org.openbmc.Networ=
kManager&quot;;<br>&gt; @@ -64,6 +65,37 @@ ipmi=5Fret=5Ft ipmi=5Ftransport=
=5Fset=5Flan(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &nbsp; &nb=
sp; &nbsp;{<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sprintf(new=5Fipaddr,=
 &quot;%d.%d.%d.%d&quot;, reqptr-&gt;data[0], reqptr-&gt;data[1], reqptr-&g=
t;data[2], reqptr-&gt;data[3]);<br>&gt; &nbsp; &nbsp; &nbsp;}<br>&gt; + &nb=
sp; &nbsp;else if (reqptr-&gt;parameter =3D=3D 5) // MAC<br>&gt; + &nbsp; &=
nbsp;{<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;char &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;mac[18];<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;=
sd=5Fbus=5Fmessage *reply =3D NULL, *m =3D NULL;<br>&gt; + &nbsp; &nbsp; &n=
bsp; &nbsp;sd=5Fbus=5Ferror error =3D SD=5FBUS=5FERROR=5FNULL;<br>&gt; + &n=
bsp; &nbsp; &nbsp; &nbsp;int r =3D 0;<br><br>I don't think any of these sho=
uld be initialised here.<br><br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp=
;sprintf(mac, &quot;%x:%x:%x:%x:%x:%x&quot;,<br><br>You want to use snprint=
f here.<br><br>Also, does this work? I would have thought you'd need to do =
%02x to<br>ensure leading zeroes are in the string.<br><br>&gt; + &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reqptr-&gt;data[0],<br>&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reqptr-&gt;data[1],=
<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reqptr-&g=
t;data[2],<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;reqptr-&gt;data[3],<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;reqptr-&gt;data[4],<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;reqptr-&gt;data[5]);<br>&gt; +<br>&gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp;r =3D sd=5Fbus=5Fmessage=5Fnew=5Fmethod=5Fcall(bus,&amp;m,app=
,obj,ifc,&quot;SetHwAddress&quot;);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;if=
 (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(st=
derr, &quot;Failed to add method object: %s\n&quot;, strerror(-r));<br>&gt;=
 + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; + &nbsp; &nb=
sp; &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;r =3D sd=5Fbus=5Fme=
ssage=5Fappend(m, &quot;s&quot;, mac);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp=
;if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf=
(stderr, &quot;Failed to append message data: %s\n&quot;, strerror(-r));<br=
>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; + &nbsp=
; &nbsp; &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;r =3D sd=5Fbus=
=5Fcall(bus, m, 0, &amp;error, &amp;reply);<br>&gt; + &nbsp; &nbsp; &nbsp; =
&nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fp=
rintf(stderr, &quot;Failed to call method: %s\n&quot;, strerror(-r));<br>&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; + &nbsp; &=
nbsp; &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp;}<br>&gt; &nbsp; &nbsp; &nbsp;e=
lse if (reqptr-&gt;parameter =3D=3D 6) // Subnet<br>&gt; &nbsp; &nbsp; &nbs=
p;{<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sprintf(new=5Fnetmask, &quot;=
%d.%d.%d.%d&quot;, reqptr-&gt;data[0], reqptr-&gt;data[1], reqptr-&gt;data[=
2], reqptr-&gt;data[3]);<br>&gt; --<br>&gt; 2.6.4<br>&gt;<br>&gt;<br>&gt; =
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>&gt; =
openbmc mailing list<br>&gt; openbmc@lists.ozlabs.org<br>&gt; </tt><tt><a h=
ref=3D"https://lists.ozlabs.org/listinfo/openbmc">https://lists.ozlabs.org/=
listinfo/openbmc</a></tt><tt><br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc mailing list<br>openbmc@lists.ozlabs.or=
g<br></tt><tt><a href=3D"https://lists.ozlabs.org/listinfo/openbmc">https:/=
/lists.ozlabs.org/listinfo/openbmc</a></tt><tt><br></tt><br><BR>
</body></html>

--1__=09BBF5DCDF9719F38f9e8a93df938690918c09BBF5DCDF9719F3--


--0__=09BBF5DCDF9719F38f9e8a93df938690918c09BBF5DCDF9719F3
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=09BBF5DCDF9719F38f9e8a93df938690918c09B@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=09BBF5DCDF9719F38f9e8a93df938690918c09BBF5DCDF9719F3--
