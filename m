Return-Path: <eakammer@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:400c:c0c::236; helo=mail-wr0-x236.google.com;
 envelope-from=eakammer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="eMjeEGaB"; 
 dkim-atps=neutral
Received: from mail-wr0-x236.google.com (mail-wr0-x236.google.com
 [IPv6:2a00:1450:400c:c0c::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zjm5d2dDfzF11V
 for <openbmc@lists.ozlabs.org>; Sat, 17 Feb 2018 08:10:59 +1100 (AEDT)
Received: by mail-wr0-x236.google.com with SMTP id o76so4156285wrb.7
 for <openbmc@lists.ozlabs.org>; Fri, 16 Feb 2018 13:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D9FmBD2ptziQKIB9JyaKevai9KS4QMMBb6dwOvGoYu0=;
 b=eMjeEGaBCPuRgxzh6/hUtGX9MVjT4J1NbKywRjwWyFGv1CU0UxjaDMfsuTSPnHBMOc
 /4KEWPsfFO+NsSISEGiphBq6d+Q73dDkDHQoMBxQyn3QFSRn7eiNFixPwYjuciBtxRi7
 JoJ1cdHiMwDFW5L1FE0j9UwnIeTLFSckBSGwYEwe0El1dLqb30Te/uYIRMaRNoyvgmnU
 aoipb71k3xiX8fOcATs2twGqpGZ2500AcNPoJ8Qj3dU+ydaG18XdJsIHQszesrpMLTF5
 FQ1hoveJQ/oQE2TA2zpAlGqkc/QkhYg880UfmLGnJxyRWeBhXIoTYXpqTI/bvaKEkvUK
 p5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D9FmBD2ptziQKIB9JyaKevai9KS4QMMBb6dwOvGoYu0=;
 b=o+4shmbH0mZ7vcUA3CAGVThHEayqnlk+NgA9YK3r8N4/if2DoihwYFJ/n1jo5gYcoQ
 SAc8hdIBzX0lPWtBiN1UfyfMg3hcJNbrvO/9kxYUh78dOioGvqMZk/bxek9VjJwa2OYM
 IrevRTe65vX8txQUdSRruQvk/ULWdKcy2S5G7ShJQpPUx0jcJyOYPSfjWY+Vr94LJIKu
 FFpeKXwksihE7cPKIc99BmYWmgKfZRx85sWXEiRa40vQ404SycXFiYjcbyBPfGGXUHZ0
 U/JZkSJI+M3IbIpCmTp1gb0QA/izYa4wNGyy38EVPgBVVT+H+VHtZMIUQQ99V+jB2i7F
 vRsg==
X-Gm-Message-State: APf1xPCeLTRQf8kTq8p1TcOIHyk0DwiWYufKuGkbgL6BBFaoBtRNsoK1
 mz63AfJQG1dA1exKrikB9eIAUCy83P4wEhDFXHjazw==
X-Google-Smtp-Source: AH8x224J1whSNu7tTV3QxzSz8dsdM2pdjLfsNXseQBpiAWbrijkUzL3uchcc6f41TeaD3jr41rP63JTUfRQSh00BQ9U=
X-Received: by 10.223.130.206 with SMTP id 72mr7188289wrc.45.1518815455074;
 Fri, 16 Feb 2018 13:10:55 -0800 (PST)
MIME-Version: 1.0
References: <CAEOv9APgYZ=Yzs4tjYad+tg0CupqyTx5M1cpzN3LcnBPBwj_LA@mail.gmail.com>
 <20180214171707.GF113334@mauery>
 <CACPK8Xc1TeFAPSBuZqdy5ECdfGEpk6Yp59o06O+dt=Dzw2+X-w@mail.gmail.com>
In-Reply-To: <CACPK8Xc1TeFAPSBuZqdy5ECdfGEpk6Yp59o06O+dt=Dzw2+X-w@mail.gmail.com>
From: Liz Kammer <eakammer@google.com>
Date: Fri, 16 Feb 2018 21:10:43 +0000
Message-ID: <CAEOv9ANQPPEZ9FzAOba52tJubt=oZ3eNc8hgoRVqQTT3hR_g3A@mail.gmail.com>
Subject: Re: sdbusplus port for host-ipmid
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, vernon.mauery@linux.intel.com, 
 William Kennington <wak@google.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="001a114b41cab7e43505655ac76d"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Feb 2018 21:11:02 -0000

--001a114b41cab7e43505655ac76d
Content-Type: multipart/alternative; boundary="001a114b41caae7bf305655ac78b"

--001a114b41caae7bf305655ac78b
Content-Type: text/plain; charset="UTF-8"

Hi Vernon and Joel,

> I was searching through gerrit for something else and came across this
> patch from William:

 > https://gerrit.openbmc-project.xyz/#/c/8938/

> I won't assume that because you have the same domain name in your
> email address that you're aware of each other's work. But perhaps you
> are! Either way perhaps you and William can let us know which parts
>you're working on and keep everyone on the list updated.

Yeah, William mentioned in on IRC when I also checked there. Thank you for
letting me know too!

>> I am happy to hear you are working on this. I don't know if anyone else
is
>> working on it or not, but I do know that host-ipmid is under very active
>> development. You will have fewer collisions with others if you make and
push
>> incremental changes (like for one file at a time). If you push one big
>> patchset, it will likely conflict with every other commit in review.

>That's good advice.

Agreed. I'm splitting them up and will be sending them separately.

Thanks all,
Liz


On Wed, Feb 14, 2018 at 5:22 PM Joel Stanley <joel@jms.id.au> wrote:

> Hi Liz,
>
> On Thu, Feb 15, 2018 at 3:47 AM, Vernon Mauery
> <vernon.mauery@linux.intel.com> wrote:
> > On 12-Feb-2018 11:01 PM, Liz Kammer wrote:
> >>
> >> Hi Everyone,
> >>
> >> Is anyone working on the sd_bus.h -> sdbusplus port for host-ipmid? I am
> >> hoping to work on this issue
> >> https://github.com/openbmc/phosphor-host-ipmid/issues/109, but I don't
> >> want
> >> to step on toes.
>
> I was searching through gerrit for something else and came across this
> patch from William:
>
>  https://gerrit.openbmc-project.xyz/#/c/8938/
>
> I won't assume that because you have the same domain name in your
> email address that you're aware of each other's work. But perhaps you
> are! Either way perhaps you and William can let us know which parts
> you're working on and keep everyone on the list updated.
>
> > I am happy to hear you are working on this. I don't know if anyone else
> is
> > working on it or not, but I do know that host-ipmid is under very active
> > development. You will have fewer collisions with others if you make and
> push
> > incremental changes (like for one file at a time). If you push one big
> > patchset, it will likely conflict with every other commit in review.
>
> That's good advice.
>
> Cheers,
>
> Joel
>

--001a114b41caae7bf305655ac78b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Vernon and Joel,<br><br>&gt; I was searching through ge=
rrit for something else and came across this<br>&gt; patch from William:<br=
><br>=C2=A0&gt; <a href=3D"https://gerrit.openbmc-project.xyz/#/c/8938/">ht=
tps://gerrit.openbmc-project.xyz/#/c/8938/</a><br><br>&gt; I won&#39;t assu=
me that because you have the same domain name in your<br>&gt; email address=
 that you&#39;re aware of each other&#39;s work. But perhaps you<br>&gt; ar=
e! Either way perhaps you and William can let us know which parts<br>&gt;yo=
u&#39;re working on and keep everyone on the list updated.<div><br></div><d=
iv>Yeah, William mentioned in on IRC when I also checked there. Thank you f=
or letting me know too!<br><br>&gt;&gt; I am happy to hear you are working =
on this. I don&#39;t know if anyone else is<br>&gt;&gt; working on it or no=
t, but I do know that host-ipmid is under very active<br>&gt;&gt; developme=
nt. You will have fewer collisions with others if you make and push<br>&gt;=
&gt; incremental changes (like for one file at a time). If you push one big=
<br>&gt;&gt; patchset, it will likely conflict with every other commit in r=
eview.<br><br>&gt;That&#39;s good advice.</div><div><br></div><div>Agreed. =
I&#39;m splitting them up and will be sending them separately.<br><span cla=
ss=3D""><br></span></div><div><span class=3D"">Thanks all,</span></div><div=
><span class=3D"">Liz</span></div></div><br><br><div class=3D"gmail_quote">=
<div dir=3D"ltr">On Wed, Feb 14, 2018 at 5:22 PM Joel Stanley &lt;<a href=
=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">Hi Liz,<br>
<br>
On Thu, Feb 15, 2018 at 3:47 AM, Vernon Mauery<br>
&lt;<a href=3D"mailto:vernon.mauery@linux.intel.com" target=3D"_blank">vern=
on.mauery@linux.intel.com</a>&gt; wrote:<br>
&gt; On 12-Feb-2018 11:01 PM, Liz Kammer wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi Everyone,<br>
&gt;&gt;<br>
&gt;&gt; Is anyone working on the sd_bus.h -&gt; sdbusplus port for host-ip=
mid? I am<br>
&gt;&gt; hoping to work on this issue<br>
&gt;&gt; <a href=3D"https://github.com/openbmc/phosphor-host-ipmid/issues/1=
09" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/phospho=
r-host-ipmid/issues/109</a>, but I don&#39;t<br>
&gt;&gt; want<br>
&gt;&gt; to step on toes.<br>
<br>
I was searching through gerrit for something else and came across this<br>
patch from William:<br>
<br>
=C2=A0<a href=3D"https://gerrit.openbmc-project.xyz/#/c/8938/" rel=3D"noref=
errer" target=3D"_blank">https://gerrit.openbmc-project.xyz/#/c/8938/</a><b=
r>
<br>
I won&#39;t assume that because you have the same domain name in your<br>
email address that you&#39;re aware of each other&#39;s work. But perhaps y=
ou<br>
are! Either way perhaps you and William can let us know which parts<br>
you&#39;re working on and keep everyone on the list updated.<br>
<br>
&gt; I am happy to hear you are working on this. I don&#39;t know if anyone=
 else is<br>
&gt; working on it or not, but I do know that host-ipmid is under very acti=
ve<br>
&gt; development. You will have fewer collisions with others if you make an=
d push<br>
&gt; incremental changes (like for one file at a time). If you push one big=
<br>
&gt; patchset, it will likely conflict with every other commit in review.<b=
r>
<br>
That&#39;s good advice.<br>
<br>
Cheers,<br>
<br>
Joel<br>
</blockquote></div>

--001a114b41caae7bf305655ac78b--

--001a114b41cab7e43505655ac76d
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIS6wYJKoZIhvcNAQcCoIIS3DCCEtgCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghBRMIIEXDCCA0SgAwIBAgIOSBtqDm4P/739RPqw/wcwDQYJKoZIhvcNAQELBQAwZDELMAkGA1UE
BhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExOjA4BgNVBAMTMUdsb2JhbFNpZ24gUGVy
c29uYWxTaWduIFBhcnRuZXJzIENBIC0gU0hBMjU2IC0gRzIwHhcNMTYwNjE1MDAwMDAwWhcNMjEw
NjE1MDAwMDAwWjBMMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTEiMCAG
A1UEAxMZR2xvYmFsU2lnbiBIViBTL01JTUUgQ0EgMTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
AQoCggEBALR23lKtjlZW/17kthzYcMHHKFgywfc4vLIjfq42NmMWbXkNUabIgS8KX4PnIFsTlD6F
GO2fqnsTygvYPFBSMX4OCFtJXoikP2CQlEvO7WooyE94tqmqD+w0YtyP2IB5j4KvOIeNv1Gbnnes
BIUWLFxs1ERvYDhmk+OrvW7Vd8ZfpRJj71Rb+QQsUpkyTySaqALXnyztTDp1L5d1bABJN/bJbEU3
Hf5FLrANmognIu+Npty6GrA6p3yKELzTsilOFmYNWg7L838NS2JbFOndl+ce89gM36CW7vyhszi6
6LqqzJL8MsmkP53GGhf11YMP9EkmawYouMDP/PwQYhIiUO0CAwEAAaOCASIwggEeMA4GA1UdDwEB
/wQEAwIBBjAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwEgYDVR0TAQH/BAgwBgEB/wIB
ADAdBgNVHQ4EFgQUyzgSsMeZwHiSjLMhleb0JmLA4D8wHwYDVR0jBBgwFoAUJiSSix/TRK+xsBtt
r+500ox4AAMwSwYDVR0fBEQwQjBAoD6gPIY6aHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9ncy9n
c3BlcnNvbmFsc2lnbnB0bnJzc2hhMmcyLmNybDBMBgNVHSAERTBDMEEGCSsGAQQBoDIBKDA0MDIG
CCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzANBgkqhkiG
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
CCsGAQUFBzAChjRodHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9nc2h2c21pbWVj
YTEuY3J0MB0GA1UdDgQWBBRKc0XklRjS9qxl3wknfR4knnRPBTAfBgNVHSMEGDAWgBTLOBKwx5nA
eJKMsyGV5vQmYsDgPzBMBgNVHSAERTBDMEEGCSsGAQQBoDIBKDA0MDIGCCsGAQUFBwIBFiZodHRw
czovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzA7BgNVHR8ENDAyMDCgLqAshipodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzaHZzbWltZWNhMS5jcmwwDgYDVR0PAQH/BAQDAgWgMB0G
A1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDANBgkqhkiG9w0BAQsFAAOCAQEADBPYLj+1MDj5
StMzZj76WyQD7VFBAnhav0QOQYzcCjZ+BpXG8U2Ym8K7iIjcoNFPN7z/OsxyJ0Nzat5N6FoRyTTM
z7wxxsroeqmxlj6zwnPzwlFK7rg6uaLne7Z2Miyf4HoBYjGeuyjWUTaQvlDrrp/AhJE+K3YDmhWG
6vOOrxeerRwdkG7yqI7J2jrvRCRUpUCbUsIzT0LhpT43Wk6eME+ssppINxREBpLsCKK6090OE1z+
8XFbeE+m3Qs8sqSjZ1B8Gn7TuGfrZSTlzXmD81PDs37FYDHI1mtJO/1O0aS0JEj4MBbLIbfIHBbh
gmmBhOfDpj6AKMxIvlSEKQEVbjGCAl4wggJaAgEBMFwwTDELMAkGA1UEBhMCQkUxGTAXBgNVBAoT
EEdsb2JhbFNpZ24gbnYtc2ExIjAgBgNVBAMTGUdsb2JhbFNpZ24gSFYgUy9NSU1FIENBIDECDGX3
Pyzdq+yB+TM2VzANBglghkgBZQMEAgEFAKCB1DAvBgkqhkiG9w0BCQQxIgQgzCK8RmdZARaNh2EN
sNm4R8sjCIWzNJ936NX+SS3AuTowGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0B
CQUxDxcNMTgwMjE2MjExMDU1WjBpBgkqhkiG9w0BCQ8xXDBaMAsGCWCGSAFlAwQBKjALBglghkgB
ZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBCjALBgkqhkiG9w0BAQcw
CwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAE4F5aambZBn4uCoiKafxi3dWOgkd40CMK/0
hB57y/6/cZlvbrXYmEmCncCkLSk71pJ65Lla+ExPyq4GYek2QTlPDV0wAmXTdzmHXLa4wiM+DDbg
KUUX8xtoI+Lfmmo761Sr97wQB2p6DT0xkdKBA3V/rAVbtcoAUPUVq8F12/cOiYafJuS52W6/N/xI
ip1+rOBRj74FLse+ftOQGlIx0UlPGXwIbvHx77GHEHuRgaSg2UtA7IFfrrcClSFMsTe7zkgKH1NB
fFHUSw+4UDWVdJk6pu97Z1MmvHf0SauiF4OylEqpIlyuIluQd9KNQDJqgovIvKAyYMjMOi/ZAxHu
Z08=
--001a114b41cab7e43505655ac76d--
