Return-Path: <shliyi@cn.ibm.com>
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 507021A01E7
 for <openbmc@lists.ozlabs.org>; Mon,  7 Dec 2015 02:55:11 +1100 (AEDT)
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Mon, 7 Dec 2015 01:55:09 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 7 Dec 2015 01:55:07 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 961182CE8050
 for <openbmc@lists.ozlabs.org>; Mon,  7 Dec 2015 02:55:06 +1100 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tB6FswHg56885496
 for <openbmc@lists.ozlabs.org>; Mon, 7 Dec 2015 02:55:06 +1100
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tB6FsYRi005654
 for <openbmc@lists.ozlabs.org>; Mon, 7 Dec 2015 02:54:34 +1100
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tB6FsWiS005598
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Mon, 7 Dec 2015 02:54:33 +1100
Message-Id: <201512061554.tB6FsWiS005598@d23av06.au.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Sun, 6 Dec 2015 08:54:08 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.81)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Sun, 6 Dec 2015 08:54:06 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Sun, 6 Dec 2015 15:54:05 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.103)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Sun, 6 Dec 2015 15:54:03 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2015120615552756-73950 ;
 Sun, 6 Dec 2015 15:55:27 +0000 
In-Reply-To: <1449416426-1683-3-git-send-email-openbmc-patches@stwcx.xyz>
Subject: Re: [PATCH linux v2 2/3] gpio/aspeed: Use handler_data in
 aspeed_gpio_irq_handler.
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
From: "Yi TZ Li" <shliyi@cn.ibm.com>
Date: Sun, 6 Dec 2015 23:53:57 +0800
References: <1449416426-1683-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1449416426-1683-3-git-send-email-openbmc-patches@stwcx.xyz>
X-KeepSent: 3A71EC44:B75A9B74-00257F13:00567CC1;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1SHF211 December 19, 2013
X-LLNOutbound: False
X-Disclaimed: 39751
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=8FBBF580DFC5FA518f9e8a93df938690918c8FBBF580DFC5FA51"
Content-Disposition: inline
x-cbid: 15120615-0009-0000-0000-0000027CE8FB
X-IBM-ISS-SpamDetectors: Score=0.449102; BY=0.186961; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.449102; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004641; HX=3.00000236; KW=3.00000007;
 PH=3.00000004; SC=3.00000122; SDB=6.00627085; UDB=6.00279897; UTC=2015-12-06
 15:54:04
x-cbparentid: 15120615-4536-0000-0000-0000053B644B
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
X-List-Received-Date: Sun, 06 Dec 2015 15:55:11 -0000


--0__=8FBBF580DFC5FA518f9e8a93df938690918c8FBBF580DFC5FA51
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII

Sorry dear mailing list,

I tried to send pull request. But the pull request includes Jeremy's commit
as well. Is this expected behavior or how to do pull request properly?

Please help.

Here is the commits of my forked linux repository dev-4.3 branch:
"d24fe31 [PATCH v3] hwmon: Add occ=5Fi2c HWMON driver - Revise code based on
comments from Jeremy Kerr <jk@ozlabs.org>. - Add new HWMON attributes
7940494 gpio/aspeed: Use handler=5Fdata in aspeed=5Fgpio=5Firq=5Fhandler.
fa744b2 Add BMC HWMON driver to kernel. Format patch based on Joel's
comments.
46b1744 net/faraday: Use ncsi=5Fstop=5Fdev()"

Here is the openbmc/linux dev-4.3 branch:
"6041e18 gpio/aspeed: Use handler=5Fdata in aspeed=5Fgpio=5Firq=5Fhandler.
46b1744 net/faraday: Use ncsi=5Fstop=5Fdev()"

Thanks
-Yi



"openbmc" <openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org> wrote on
12/06/2015 11:40:25 PM:

> From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
> To: openbmc@lists.ozlabs.org
> Date: 12/06/2015 11:42 PM
> Subject: [PATCH linux v2 2/3] gpio/aspeed: Use handler=5Fdata in
> aspeed=5Fgpio=5Firq=5Fhandler.
> Sent by: "openbmc" <openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org>
>
> From: Jeremy Kerr <jk@ozlabs.org>
>
> In the port to 4.3, we converted to the newer irq api, but used the
> chip=5Fdata for the struct aspeed=5Fgpio pointer, rather than the
> handler=5Fdata.
>
> We use irq=5Fset=5Fchaned=5Fhandler=5Fand=5Fdata to establish this pointe=
r, which
> sets handler=5Fdata. This change uses the appropriate pointer in our
> handler instead.
>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> ---
>  drivers/gpio/gpio-aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 87e159a..152b7d4 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -302,8 +302,8 @@ static int aspeed=5Fgpio=5Fset=5Ftype(struct irq=5Fda=
ta
> *d, unsigned int type)
>
>  static void aspeed=5Fgpio=5Firq=5Fhandler(struct irq=5Fdesc *desc)
>  {
> +   struct aspeed=5Fgpio *gpio =3D irq=5Fdesc=5Fget=5Fhandler=5Fdata(desc=
);
>     struct irq=5Fchip *chip =3D irq=5Fdesc=5Fget=5Fchip(desc);
> -   struct aspeed=5Fgpio *gpio =3D irq=5Fdesc=5Fget=5Fchip=5Fdata(desc);
>     unsigned int i, p, girq;
>     unsigned long reg;
>
> --
> 2.6.3
>
>
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--0__=8FBBF580DFC5FA518f9e8a93df938690918c8FBBF580DFC5FA51
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>Sorry dear mailing list,<br><br>I tried to send pull request=
. But the pull request includes Jeremy's commit as well. Is this expected b=
ehavior or how to do pull request properly?<br><br>Please help.<br><br>Here=
 is the commits of my forked linux repository dev-4.3 branch:<br>&quot;d24f=
e31 [PATCH v3] hwmon: Add occ=5Fi2c HWMON driver - Revise code based on com=
ments from Jeremy Kerr &lt;jk@ozlabs.org&gt;. - Add new HWMON attributes<br=
>7940494 gpio/aspeed: Use handler=5Fdata in aspeed=5Fgpio=5Firq=5Fhandler.<=
br>fa744b2 Add BMC HWMON driver to kernel. Format patch based on Joel's com=
ments.<br>46b1744 net/faraday: Use ncsi=5Fstop=5Fdev()&quot;<br><br>Here is=
 the openbmc/linux dev-4.3 branch:<br>&quot;6041e18 gpio/aspeed: Use handle=
r=5Fdata in aspeed=5Fgpio=5Firq=5Fhandler.<br>46b1744 net/faraday: Use ncsi=
=5Fstop=5Fdev()&quot;<br><br>Thanks<br>-Yi<br><br><br><br><tt>&quot;openbmc=
&quot; &lt;openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org&gt; wrote o=
n 12/06/2015 11:40:25 PM:<br><br>&gt; From: OpenBMC Patches &lt;openbmc-pat=
ches@stwcx.xyz&gt;</tt><br><tt>&gt; To: openbmc@lists.ozlabs.org</tt><br><t=
t>&gt; Date: 12/06/2015 11:42 PM</tt><br><tt>&gt; Subject: [PATCH linux v2 =
2/3] gpio/aspeed: Use handler=5Fdata in <br>&gt; aspeed=5Fgpio=5Firq=5Fhand=
ler.</tt><br><tt>&gt; Sent by: &quot;openbmc&quot; &lt;openbmc-bounces+shli=
yi=3Dcn.ibm.com@lists.ozlabs.org&gt;</tt><br><tt>&gt; <br>&gt; From: Jeremy=
 Kerr &lt;jk@ozlabs.org&gt;<br>&gt; <br>&gt; In the port to 4.3, we convert=
ed to the newer irq api, but used the<br>&gt; chip=5Fdata for the struct as=
peed=5Fgpio pointer, rather than the<br>&gt; handler=5Fdata.<br>&gt; <br>&g=
t; We use irq=5Fset=5Fchaned=5Fhandler=5Fand=5Fdata to establish this point=
er, which<br>&gt; sets handler=5Fdata. This change uses the appropriate poi=
nter in our<br>&gt; handler instead.<br>&gt; <br>&gt; Signed-off-by: Jeremy=
 Kerr &lt;jk@ozlabs.org&gt;<br>&gt; ---<br>&gt; &nbsp;drivers/gpio/gpio-asp=
eed.c | 2 +-<br>&gt; &nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br=
>&gt; <br>&gt; diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-=
aspeed.c<br>&gt; index 87e159a..152b7d4 100644<br>&gt; --- a/drivers/gpio/g=
pio-aspeed.c<br>&gt; +++ b/drivers/gpio/gpio-aspeed.c<br>&gt; @@ -302,8 +30=
2,8 @@ static int aspeed=5Fgpio=5Fset=5Ftype(struct irq=5Fdata <br>&gt; *d,=
 unsigned int type)<br>&gt; &nbsp;<br>&gt; &nbsp;static void aspeed=5Fgpio=
=5Firq=5Fhandler(struct irq=5Fdesc *desc)<br>&gt; &nbsp;{<br>&gt; + &nbsp; =
struct aspeed=5Fgpio *gpio =3D irq=5Fdesc=5Fget=5Fhandler=5Fdata(desc);<br>=
&gt; &nbsp; &nbsp; struct irq=5Fchip *chip =3D irq=5Fdesc=5Fget=5Fchip(desc=
);<br>&gt; - &nbsp; struct aspeed=5Fgpio *gpio =3D irq=5Fdesc=5Fget=5Fchip=
=5Fdata(desc);<br>&gt; &nbsp; &nbsp; unsigned int i, p, girq;<br>&gt; &nbsp=
; &nbsp; unsigned long reg;<br>&gt; &nbsp;<br>&gt; -- <br>&gt; 2.6.3<br>&gt=
; <br>&gt; <br>&gt; =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F<br>&gt; openbmc mailing list<br>&gt; openbmc@lists.ozlabs.org<=
br>&gt; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc">https://lists=
.ozlabs.org/listinfo/openbmc</a><br></tt><BR>
</body></html>

--0__=8FBBF580DFC5FA518f9e8a93df938690918c8FBBF580DFC5FA51--
