Return-Path: <raltherr@google.com>
Received: from mail-yw0-x231.google.com (mail-yw0-x231.google.com
 [IPv6:2607:f8b0:4002:c05::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdpsx0fwqzDsfk
 for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2016 03:00:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=jf+x8w8n; 
 dkim-atps=neutral
Received: by mail-yw0-x231.google.com with SMTP id i129so16313405ywb.0
 for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2016 10:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=b6fJv87kqgnA9uWOBx4T2uc8GzLCJGxLaUhVsAi5vpc=;
 b=jf+x8w8nLqemKYKAR0tS22P1i6CvG+Ql61glkZog+HEEhES6gRkYzdBep2VEzurHuq
 nCG4VRG3H/a9j9jxq2C08h4JDoAc+lR9zAeKuFLxRfcwPCQTHQfeCxBDvCbQIQv2VK5/
 ERyYpAtcoulPgt8vEFTHn/wCn/Th1wPbxwvEYcbztKEbVmzu3H5e+7J59KJ8qnwX0lVc
 Qe/EYQO8PvduoeNG/Hktskt1HVk8GkF3OzsDwl7519vI9CVEeJNVRCBq9kJawCr58yuW
 EwzQHAdyYC1vHy6cxA3nSCfUkS5ZnLe+8Fl3sLj9ytZLY8LoiXoHusvmqVpCmcstKqDe
 ttnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=b6fJv87kqgnA9uWOBx4T2uc8GzLCJGxLaUhVsAi5vpc=;
 b=JwsF6IYkBYK9WeEPjQL5vF15hGsClMa4JId7DmA/0AECMezTiVgMQzh6D1f2y9dLJ2
 6RC/m14YsXZozFOv3rehZsg5pGS7M21EGSrANgzjiR2Kd4K2nEblB7StGhrfAAfoUK2U
 6JWFUsmFVfsPlVHyuL4c0HoiXQI558LMpq5JdZXYd6sTnL/XYAzcEwxSKEd/SFxlZshy
 LAa0iQZsqa6s0+QinsZTcGZQ/cDQ73L8qMa3PgTNlfyWDxEmfpDKVGPCDkyvTBlKPmTx
 0M15NMncFWl+A7+YKilElxhutXH49NSVGPDFHqSlG6EDQ0E5oUlt65kuWzEYYwkt4uVD
 V+mg==
X-Gm-Message-State: AE9vXwPABIDMFFiIfvOjz6m5E8LgQf+t19ztQABobRnKg5MD2589iYF/B0V4s0KzPgcOgASbOPOPTM33DHHPAFG+
X-Received: by 10.13.254.135 with SMTP id o129mr31071297ywf.117.1474390833664; 
 Tue, 20 Sep 2016 10:00:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.160.4 with HTTP; Tue, 20 Sep 2016 10:00:33 -0700 (PDT)
In-Reply-To: <a369c981-6567-95b5-4529-33303c74eca2@splitted-desktop.com>
References: <C160D2872FE0DE4683E1910F9BF829413D2A3893@avsrvexchmbx2.microsemi.net>
 <a369c981-6567-95b5-4529-33303c74eca2@splitted-desktop.com>
From: Rick Altherr <raltherr@google.com>
Date: Tue, 20 Sep 2016 10:00:33 -0700
Message-ID: <CAPLgG==OS=pyi590GSRDrs8-q6W+B5m3y_cjGe90gGW3+mrAAA@mail.gmail.com>
Subject: Re: Aspeed board for development
To: jean-marie.verdun@splitted-desktop.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c07e31ee73d3b053cf35d59
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
X-List-Received-Date: Tue, 20 Sep 2016 17:00:38 -0000

--94eb2c07e31ee73d3b053cf35d59
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

My understanding is that Aspeed eval boards can only be obtained directly
from Aspeed.  Until RaspberryPi support is ready, things like Redfish can
be roughly tested with the qemu support for the Palmetto platform.  See
https://github.com/openbmc/docs/blob/master/cheatsheet.md#using-qemu for
instructions on how to use it.

On Tue, Sep 20, 2016 at 12:09 AM, Jean-Marie Verdun <
jean-marie.verdun@splitted-desktop.com> wrote:

> Hi,
>
> I am also really interested by this. We are currently stuck with Raspberr=
y
> Pi because of hardware availibility and lack of debug function on our OCP
> server (if something goes wrong it is really hard to restart the system).
>
> vejmarie
>
>
> Le 20/09/2016 =C3=A0 08:38, Arjun Padmanabhan a =C3=A9crit :
>
> Hi,
>
>
>
> I am working on requirement  to deploy our redfish server on openbmc
> environment.
>
>
>
> Initial plan was to work on rapsberryPi3 board.  Since rapsberryPi does
> not have full support as of now(Git issue #587), I am planning to build
> openbmc image for aspeed board and deploy the image on it.
>
>
>
> I could not find purchase link to buy aspeed boards. Please let me know
> the procedure to purchase.
>
>
>
> Also if anyone can share some information on which board version/model I
> need to buy for development, it will be helpful.
>
>
>
> Regards
>
> Arjun Padmanabhan
>
>
> _______________________________________________
> openbmc mailing listopenbmc@lists.ozlabs.orghttps://lists.ozlabs.org/list=
info/openbmc
>
>
>
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
>

--94eb2c07e31ee73d3b053cf35d59
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">My understanding is that Aspeed eval boards can only be ob=
tained directly from Aspeed.=C2=A0 Until RaspberryPi support is ready, thin=
gs like Redfish can be roughly tested with the qemu support for the Palmett=
o platform.=C2=A0 See=C2=A0<a href=3D"https://github.com/openbmc/docs/blob/=
master/cheatsheet.md#using-qemu">https://github.com/openbmc/docs/blob/maste=
r/cheatsheet.md#using-qemu</a> for instructions on how to use it.</div><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Sep 20, 2016 =
at 12:09 AM, Jean-Marie Verdun <span dir=3D"ltr">&lt;<a href=3D"mailto:jean=
-marie.verdun@splitted-desktop.com" target=3D"_blank">jean-marie.verdun@spl=
itted-desktop.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000">
    <div class=3D"m_-7972865524594789648moz-cite-prefix">Hi,<br>
      <br>
      I am also really interested by this. We are currently stuck with
      Raspberry Pi because of hardware availibility and lack of debug
      function on our OCP server (if something goes wrong it is really
      hard to restart the system).<br>
      <br>
      vejmarie<div><div class=3D"h5"><br>
      <br>
      Le 20/09/2016 =C3=A0 08:38, Arjun Padmanabhan a =C3=A9crit=C2=A0:<br>
    </div></div></div>
    <blockquote type=3D"cite"><div><div class=3D"h5">
     =20
     =20
     =20
      <div class=3D"m_-7972865524594789648WordSection1">
        <p class=3D"MsoNormal">Hi,<u></u><u></u></p>
        <p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
        <p class=3D"m_-7972865524594789648MsoPlainText">I am working on req=
uirement =C2=A0to deploy
          our redfish server on openbmc environment.<u></u><u></u></p>
        <p class=3D"m_-7972865524594789648MsoPlainText"><u></u>=C2=A0<u></u=
></p>
        <p class=3D"m_-7972865524594789648MsoPlainText">Initial plan was to=
 work on rapsberryPi3
          board.=C2=A0 Since rapsberryPi does not have full support as of
          now(Git issue #587), I am planning to build openbmc image for
          aspeed board and deploy the image on it.<u></u><u></u></p>
        <p class=3D"m_-7972865524594789648MsoPlainText"><u></u>=C2=A0<u></u=
></p>
        <p class=3D"m_-7972865524594789648MsoPlainText">I could not find pu=
rchase link to buy
          aspeed boards. Please let me know the procedure to purchase.<u></=
u><u></u></p>
        <p class=3D"m_-7972865524594789648MsoPlainText"><u></u>=C2=A0<u></u=
></p>
        <p class=3D"m_-7972865524594789648MsoPlainText">Also if anyone can =
share some
          information on which board version/model I need to buy for
          development, it will be helpful.<u></u><u></u></p>
        <p class=3D"m_-7972865524594789648MsoPlainText"><u></u>=C2=A0<u></u=
></p>
        <p class=3D"m_-7972865524594789648MsoPlainText">Regards<u></u><u></=
u></p>
        <p class=3D"m_-7972865524594789648MsoPlainText">Arjun Padmanabhan<u=
></u><u></u></p>
      </div>
      <br>
      <fieldset class=3D"m_-7972865524594789648mimeAttachmentHeader"></fiel=
dset>
      <br>
      </div></div><pre>______________________________<wbr>_________________
openbmc mailing list
<a class=3D"m_-7972865524594789648moz-txt-link-abbreviated" href=3D"mailto:=
openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>
<a class=3D"m_-7972865524594789648moz-txt-link-freetext" href=3D"https://li=
sts.ozlabs.org/listinfo/openbmc" target=3D"_blank">https://lists.ozlabs.org=
/<wbr>listinfo/openbmc</a>
</pre>
    </blockquote>
    <br>
    <div class=3D"m_-7972865524594789648moz-signature">
      <table border=3D"0">
        <tbody>
          <tr>
            <td><br>
            </td>
            <td><br>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>

<br>______________________________<wbr>_________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a><br>
<br></blockquote></div><br></div>

--94eb2c07e31ee73d3b053cf35d59--
