Return-Path: <njames@us.ibm.com>
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 88FA81A006D
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 23:47:57 +1100 (AEDT)
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Wed, 10 Feb 2016 07:47:54 -0500
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 10 Feb 2016 07:47:52 -0500
X-IBM-Helo: d01dlp02.pok.ibm.com
X-IBM-MailFrom: njames@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 39AB36E803C
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 07:34:44 -0500 (EST)
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1AClqBG36307120
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 12:47:52 GMT
Received: from d01av04.pok.ibm.com (localhost [127.0.0.1])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1AClp8W010768
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 07:47:51 -0500
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u1ACloMH010661
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 07:47:51 -0500
Message-Id: <201602101247.u1ACloMH010661@d01av04.pok.ibm.com>
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Wed, 10 Feb 2016 05:47:50 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.91)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Wed, 10 Feb 2016 05:47:47 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: njames@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Wed, 10 Feb 2016 12:47:46 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.94)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 10 Feb 2016 12:47:44 -0000
Received: from us1a3-mail62.a3.dal09.isc4sb.com ([10.142.3.202])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016021012490722-167290 ;
 Wed, 10 Feb 2016 12:49:07 +0000 
In-Reply-To: <CACPK8Xe4+YUnOc=+Qn75knMx+cFvpWx0V8QCeDiXO45Nxg_s1A@mail.gmail.com>
Subject: Re: [PATCH] serial/aspeed-vuart: Disable host TX discard mode during
 init
To: Joel Stanley <joel@jms.id.au>
Cc: Jeremy Kerr <jk@ozlabs.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: "Norman James" <njames@us.ibm.com>
Date: Wed, 10 Feb 2016 06:47:27 -0600
References: <1455027957-9524-1-git-send-email-jk@ozlabs.org>
 <CACPK8Xe4+YUnOc=+Qn75knMx+cFvpWx0V8QCeDiXO45Nxg_s1A@mail.gmail.com>
X-KeepSent: 1C874BF3:ACB835C5-86257F55:0045C677;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP2 SHF37 August 25, 2014
X-LLNOutbound: False
X-Disclaimed: 50795
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=09BBF5C6DFD640E78f9e8a93df938690918c09BBF5C6DFD640E7"
x-cbid: 16021012-0057-0000-0000-00000362B94A
X-IBM-ISS-SpamDetectors: Score=0.421136; BY=0.287464; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.421136; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004901; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000142; SDB=6.00657915; UDB=6.00298632; UTC=2016-02-10
 12:47:45
x-cbparentid: 16021012-4778-0000-0000-000001EE59A4
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
X-List-Received-Date: Wed, 10 Feb 2016 12:47:58 -0000

--0__=09BBF5C6DFD640E78f9e8a93df938690918c09BBF5C6DFD640E7
Content-type: multipart/alternative; 
	Boundary="1__=09BBF5C6DFD640E78f9e8a93df938690918c09BBF5C6DFD640E7"


--1__=09BBF5C6DFD640E78f9e8a93df938690918c09BBF5C6DFD640E7
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


I've tested it pretty well too.   I have powered on/off several times and
made sure boot makes it to petitboot and console behaves normal with the
menu.    I would add Tested-by flag if someone could tell me how to do
that.

The only strange thing is that the screen utility hangs for several seconds
when exiting (Ctrl-a k) console which it didn't do with regular UART.


Regards,
Norman James
IBM - POWER Systems Architect
Phone: 1-512-286-6807 (T/L: 363-6807)
Internet: njames@us.ibm.com




From:	Joel Stanley <joel@jms.id.au>
To:	Jeremy Kerr <jk@ozlabs.org>
Cc:	OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date:	02/09/2016 11:40 PM
Subject:	Re: [PATCH] serial/aspeed-vuart: Disable host TX discard mode
            during init
Sent by:	"openbmc" <openbmc-bounces+njames=3Dus.ibm.com@lists.ozlabs.org>



On Wed, Feb 10, 2016 at 12:55 AM, Jeremy Kerr <jk@ozlabs.org> wrote:
> If host TX discard mode is enabled, we don't see the LSR[RBR} bit
> getting set on new characters written on the host side. This makes the
> VUART a little useless.
>
> This change set this bit during VUART initialisation, to disable host
> TX discard.

Thanks! I've pulled it in; I'll push it out once I've given it a spin.

Do you have some notes on how you tested it?

>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/tty/serial/aspeed-vuart.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/aspeed-vuart.c
b/drivers/tty/serial/aspeed-vuart.c
> index f1988dd..a56d3a9 100644
> --- a/drivers/tty/serial/aspeed-vuart.c
> +++ b/drivers/tty/serial/aspeed-vuart.c
> @@ -20,7 +20,8 @@
>  #include "8250/8250.h"
>
>  #define AST=5FVUART=5FGCRA         0x20
> -#define AST=5FVUART=5FGCRA=5FVUART=5FEN                0x1
> +#define AST=5FVUART=5FGCRA=5FVUART=5FEN                0x01
> +#define AST=5FVUART=5FGCRA=5FHOST=5FTX=5FDISCARD 0x20
>  #define AST=5FVUART=5FGCRB         0x24
>  #define AST=5FVUART=5FGCRB=5FHOST=5FSIRQ=5FMASK  0xf0
>  #define AST=5FVUART=5FGCRB=5FHOST=5FSIRQ=5FSHIFT 4
> @@ -143,6 +144,17 @@ static ssize=5Ft ast=5Fvuart=5Fset=5Fsirq(struct dev=
ice
*dev,
>  static DEVICE=5FATTR(sirq, S=5FIWUSR | S=5FIRUGO,
>                 ast=5Fvuart=5Fshow=5Fsirq, ast=5Fvuart=5Fset=5Fsirq);
>
> +static void ast=5Fvuart=5Fsetup(struct ast=5Fvuart *vuart)
> +{
> +       u8 reg;
> +
> +       /* disable TX discard mode */
> +       reg =3D readb(vuart->regs + AST=5FVUART=5FGCRA);
> +       reg |=3D AST=5FVUART=5FGCRA=5FHOST=5FTX=5FDISCARD;
> +       writeb(reg, vuart->regs + AST=5FVUART=5FGCRA);
> +}
> +
> +
>  /**
>   * The device tree parsinc code here is heavily based on that of the
of=5Fserial
>   * driver, but we have a few core differences, as we need to use our own
> @@ -261,6 +273,7 @@ static int ast=5Fvuart=5Fprobe(struct platform=5Fdevi=
ce
*pdev)
>
>         vuart->line =3D rc;
>         platform=5Fset=5Fdrvdata(pdev, vuart);
> +       ast=5Fvuart=5Fsetup(vuart);
>
>         /* extra sysfs control */
>         rc =3D device=5Fcreate=5Ffile(&pdev->dev, &dev=5Fattr=5Flpc=5Fadd=
ress);
> --
> 2.5.0
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


--1__=09BBF5C6DFD640E78f9e8a93df938690918c09BBF5C6DFD640E7
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>I've tested it pretty well too.   I have powered on/off seve=
ral times and made sure boot makes it to petitboot and console behaves norm=
al with the menu.    I would add Tested-by flag if someone could tell me ho=
w to do that.<br><br>The only strange thing is that the screen utility hang=
s for several seconds when exiting (Ctrl-a k) console which it didn't do wi=
th regular UART.<br><br><br>Regards,<br>Norman James<br>IBM - POWER Systems=
 Architect<br>Phone: 1-512-286-6807 (T/L: 363-6807)<br>Internet: njames@us.=
ibm.com<br><br><br><img width=3D"16" height=3D"16" src=3D"cid:1=5F=5F=3D09B=
BF5C6DFD640E78f9e8a93df938690918c09B@" border=3D"0" alt=3D"Inactive hide de=
tails for Joel Stanley ---02/09/2016 11:40:39 PM---On Wed, Feb 10, 2016 at =
12:55 AM, Jeremy Kerr &lt;jk@ozlabs.org"><font color=3D"#424282">Joel Stanl=
ey ---02/09/2016 11:40:39 PM---On Wed, Feb 10, 2016 at 12:55 AM, Jeremy Ker=
r &lt;jk@ozlabs.org&gt; wrote: &gt; If host TX discard mode is en</font><br=
><br><font size=3D"2" color=3D"#5F5F5F">From:        </font><font size=3D"2=
">Joel Stanley &lt;joel@jms.id.au&gt;</font><br><font size=3D"2" color=3D"#=
5F5F5F">To:        </font><font size=3D"2">Jeremy Kerr &lt;jk@ozlabs.org&gt=
;</font><br><font size=3D"2" color=3D"#5F5F5F">Cc:        </font><font size=
=3D"2">OpenBMC Maillist &lt;openbmc@lists.ozlabs.org&gt;</font><br><font si=
ze=3D"2" color=3D"#5F5F5F">Date:        </font><font size=3D"2">02/09/2016 =
11:40 PM</font><br><font size=3D"2" color=3D"#5F5F5F">Subject:        </fon=
t><font size=3D"2">Re: [PATCH] serial/aspeed-vuart: Disable host TX discard=
 mode during init</font><br><font size=3D"2" color=3D"#5F5F5F">Sent by:    =
    </font><font size=3D"2">&quot;openbmc&quot; &lt;openbmc-bounces+njames=
=3Dus.ibm.com@lists.ozlabs.org&gt;</font><br><hr width=3D"100%" size=3D"2" =
align=3D"left" noshade style=3D"color:#8091A5; "><br><br><br><tt>On Wed, Fe=
b 10, 2016 at 12:55 AM, Jeremy Kerr &lt;jk@ozlabs.org&gt; wrote:<br>&gt; If=
 host TX discard mode is enabled, we don't see the LSR[RBR} bit<br>&gt; get=
ting set on new characters written on the host side. This makes the<br>&gt;=
 VUART a little useless.<br>&gt;<br>&gt; This change set this bit during VU=
ART initialisation, to disable host<br>&gt; TX discard.<br><br>Thanks! I've=
 pulled it in; I'll push it out once I've given it a spin.<br><br>Do you ha=
ve some notes on how you tested it?<br><br>&gt;<br>&gt; Signed-off-by: Jere=
my Kerr &lt;jk@ozlabs.org&gt;<br><br>Reviewed-by: Joel Stanley &lt;joel@jms=
.id.au&gt;<br>&gt; ---<br>&gt; &nbsp;drivers/tty/serial/aspeed-vuart.c | 15=
 ++++++++++++++-<br>&gt; &nbsp;1 file changed, 14 insertions(+), 1 deletion=
(-)<br>&gt;<br>&gt; diff --git a/drivers/tty/serial/aspeed-vuart.c b/driver=
s/tty/serial/aspeed-vuart.c<br>&gt; index f1988dd..a56d3a9 100644<br>&gt; -=
-- a/drivers/tty/serial/aspeed-vuart.c<br>&gt; +++ b/drivers/tty/serial/asp=
eed-vuart.c<br>&gt; @@ -20,7 +20,8 @@<br>&gt; &nbsp;#include &quot;8250/825=
0.h&quot;<br>&gt;<br>&gt; &nbsp;#define AST=5FVUART=5FGCRA &nbsp; &nbsp; &n=
bsp; &nbsp; 0x20<br>&gt; -#define AST=5FVUART=5FGCRA=5FVUART=5FEN &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0x1<br>&gt; +#define AST=5FVU=
ART=5FGCRA=5FVUART=5FEN &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;0x01<br>&gt; +#define AST=5FVUART=5FGCRA=5FHOST=5FTX=5FDISCARD 0x20<br>=
&gt; &nbsp;#define AST=5FVUART=5FGCRB &nbsp; &nbsp; &nbsp; &nbsp; 0x24<br>&=
gt; &nbsp;#define AST=5FVUART=5FGCRB=5FHOST=5FSIRQ=5FMASK &nbsp;0xf0<br>&gt=
; &nbsp;#define AST=5FVUART=5FGCRB=5FHOST=5FSIRQ=5FSHIFT 4<br>&gt; @@ -143,=
6 +144,17 @@ static ssize=5Ft ast=5Fvuart=5Fset=5Fsirq(struct device *dev,<=
br>&gt; &nbsp;static DEVICE=5FATTR(sirq, S=5FIWUSR | S=5FIRUGO,<br>&gt; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ast=5Fvuart=5Fshow=5Fs=
irq, ast=5Fvuart=5Fset=5Fsirq);<br>&gt;<br>&gt; +static void ast=5Fvuart=5F=
setup(struct ast=5Fvuart *vuart)<br>&gt; +{<br>&gt; + &nbsp; &nbsp; &nbsp; =
u8 reg;<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; /* disable TX discard mode=
 */<br>&gt; + &nbsp; &nbsp; &nbsp; reg =3D readb(vuart-&gt;regs + AST=5FVUA=
RT=5FGCRA);<br>&gt; + &nbsp; &nbsp; &nbsp; reg |=3D AST=5FVUART=5FGCRA=5FHO=
ST=5FTX=5FDISCARD;<br>&gt; + &nbsp; &nbsp; &nbsp; writeb(reg, vuart-&gt;reg=
s + AST=5FVUART=5FGCRA);<br>&gt; +}<br>&gt; +<br>&gt; +<br>&gt; &nbsp;/**<b=
r>&gt; &nbsp; * The device tree parsinc code here is heavily based on that =
of the of=5Fserial<br>&gt; &nbsp; * driver, but we have a few core differen=
ces, as we need to use our own<br>&gt; @@ -261,6 +273,7 @@ static int ast=
=5Fvuart=5Fprobe(struct platform=5Fdevice *pdev)<br>&gt;<br>&gt; &nbsp; &nb=
sp; &nbsp; &nbsp; vuart-&gt;line =3D rc;<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp=
; platform=5Fset=5Fdrvdata(pdev, vuart);<br>&gt; + &nbsp; &nbsp; &nbsp; ast=
=5Fvuart=5Fsetup(vuart);<br>&gt;<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; /* ext=
ra sysfs control */<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D device=5Fcre=
ate=5Ffile(&amp;pdev-&gt;dev, &amp;dev=5Fattr=5Flpc=5Faddress);<br>&gt; --<=
br>&gt; 2.5.0<br>&gt;<br>&gt; =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F<br>&gt; openbmc mailing list<br>&gt; openbmc@lists.oz=
labs.org<br>&gt; </tt><tt><a href=3D"https://lists.ozlabs.org/listinfo/open=
bmc">https://lists.ozlabs.org/listinfo/openbmc</a></tt><tt><br>=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc mailing l=
ist<br>openbmc@lists.ozlabs.org<br></tt><tt><a href=3D"https://lists.ozlabs=
.org/listinfo/openbmc">https://lists.ozlabs.org/listinfo/openbmc</a></tt><t=
t><br></tt><br><BR>
</body></html>

--1__=09BBF5C6DFD640E78f9e8a93df938690918c09BBF5C6DFD640E7--


--0__=09BBF5C6DFD640E78f9e8a93df938690918c09BBF5C6DFD640E7
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=09BBF5C6DFD640E78f9e8a93df938690918c09B@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=09BBF5C6DFD640E78f9e8a93df938690918c09BBF5C6DFD640E7--
