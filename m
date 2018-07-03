Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::235; helo=mail-qt0-x235.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ejIuN9QQ"; 
 dkim-atps=neutral
Received: from mail-qt0-x235.google.com (mail-qt0-x235.google.com
 [IPv6:2607:f8b0:400d:c0d::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41KfTC20dhzF1PD
 for <openbmc@lists.ozlabs.org>; Tue,  3 Jul 2018 19:48:46 +1000 (AEST)
Received: by mail-qt0-x235.google.com with SMTP id y5-v6so968725qti.12
 for <openbmc@lists.ozlabs.org>; Tue, 03 Jul 2018 02:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/fNd0mI3fL36WDAWplXPq+kEWoyKrh6dtjlt9PCCyPQ=;
 b=ejIuN9QQ+aJsVDnb1YjDwlMW3vpF9SV6Zbf1D0Cvm8a5DGvmCtYatIRgB7sWjyTcDQ
 R59ejVdSGUiJTjpbg14FCNSAF15xsPGuYajg9tag5DO/48WjuzqRzw4V/pn/8/yQM1AZ
 VmD4XmNh1HFxpayH65dj8sK4IqiSuZitKo8KzpUh1P/UuA3kQlTubqGNl4Y9Te7/PNZA
 8ukujJHfXzklXkF0zo4c3ghrXCEAaHL4APsKBJ7nRZhcyYMZ4MWVTdulD/RJgbDHmx1r
 u+APpq8f/24XbL+5uI21DYnI8arU12pep3fJDAPx66sOyUTEJHeDPJv97r8WQ/KkgCsh
 GGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/fNd0mI3fL36WDAWplXPq+kEWoyKrh6dtjlt9PCCyPQ=;
 b=Bs2BxV02+nX9Elw7RanbrnxRRAjYh5OtT+VCn4VNFE6fmPYAAmCEgx70/FpWmmINg6
 A7w19e+bOcgsqF5Wyp2sOJjX0id5o0bHifkCwPbniprHyvb9ow0P2qB1jjmsrniFrhMF
 fUOVtjjKYdcv+jSPYLNbNb47Hf+p90PBiGcGRk4YvbxJOkHnSMWc57tF1O1ap4hE5yS5
 KCih2zyWkBXXNdSDij6gSakFCRtcXArA0Uae1BMTjeI2zPvPNr/tmgD2R0I1nsnsGKRk
 MNzHhIRMGfAonyFt5tpLm4KRTVliIbSWxp78tnbd9l9v7b5LhEnisM4GTl1jtlWDrlXz
 +xEA==
X-Gm-Message-State: APt69E21kWUibxaor6zYdn7cXTCOi+2/XCgiRs+A9pdqPYNRnDQwA0qy
 l/aURnc58AHp2w6RsYyNu+NLgojUO6Q1EGljMSHELA==
X-Google-Smtp-Source: AAOMgpdHdZb91XBJdzV5b65EHvrTtQ9xgl4YV1ZHKnjrlJMXyI0SfY+NYTn0WrBq0Ly3F/E4U96p2ibH5zBSQHJMW+8=
X-Received: by 2002:ac8:709:: with SMTP id
 g9-v6mr16709132qth.110.1530611324228; 
 Tue, 03 Jul 2018 02:48:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aed:26a7:0:0:0:0:0 with HTTP;
 Tue, 3 Jul 2018 02:48:43 -0700 (PDT)
From: Henbin Chang <henbinchang@gmail.com>
Date: Tue, 3 Jul 2018 17:48:43 +0800
Message-ID: <CAG9c7cCPZFFg65e-1iOSkLqgb26-2t1SqH_AZ4JjB5-TigNqzw@mail.gmail.com>
Subject: How to override default Kernel config
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000004518f9057015386d"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Jul 2018 09:48:48 -0000

--0000000000004518f9057015386d
Content-Type: text/plain; charset="UTF-8"

Hi,
I would like to enable a specific Kernel config in my machine.
I don't want to modify the 'defconfig'

Could anyone tell me how to do?

Thanks.
BRs,
Henbin.

--0000000000004518f9057015386d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,=C2=A0<div>I would like to enable a specific Kernel con=
fig in my machine.</div><div>I don&#39;t want to modify the &#39;<span styl=
e=3D"font-size:small;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline">defconfi=
g&#39;</span></div><div><br></div><div>Could anyone tell me how to do?</div=
><div><br></div><div>Thanks.</div><div>BRs,</div><div>Henbin.</div></div>

--0000000000004518f9057015386d--
