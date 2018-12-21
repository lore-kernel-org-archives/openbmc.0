Return-Path: <liuxiwei@inspur.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=162.243.126.186; helo=vip.corpemail.net;
 envelope-from=liuxiwei@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
Received: from vip.corpemail.net (vip.corpemail.net [162.243.126.186])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Lg8Z1GhDzDr7C
 for <openbmc@lists.ozlabs.org>; Fri, 21 Dec 2018 18:23:23 +1100 (AEDT)
Received: from ([218.57.135.44])
 by ssh248.corpemail.net (Antispam) with ASMTP (SSL) id LTM61943
 for <openbmc@lists.ozlabs.org>; Fri, 21 Dec 2018 15:17:43 +0800
Received: from mail-lj1-f169.google.com (172.30.26.1) by
 JTJNCAS08.home.langchao.com (172.30.26.38) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Fri, 21 Dec 2018 15:17:41 +0800
Received: by mail-lj1-f169.google.com with SMTP id g11-v6so3816919ljk.3
 for <openbmc@lists.ozlabs.org>; Thu, 20 Dec 2018 23:17:41 -0800 (PST)
X-Gm-Message-State: AJcUukfp06JMaV9ivol9+VxPTWAZT0tIAzGJsXDQSw5xD09dalrIoK3X
 ggek/7didxraKr7bRIl6aMjkx+Qds+pT/mHKGyE=
X-Google-Smtp-Source: ALg8bN6yNwiGGCULkdXfSzjg+c4eFISJ4MO1rekJMxnF3wjge8DcpUwj/cDQYulSu9WqiJ4J35kYzjRMrdv3lXE5NCc=
X-Received: by 2002:a2e:5747:: with SMTP id r7-v6mr751243ljd.141.1545376658468; 
 Thu, 20 Dec 2018 23:17:38 -0800 (PST)
MIME-Version: 1.0
References: <4E117ED9-B492-4197-A66F-45949E3D7178@fb.com>
 <CAHkHK09SisQ0s765c1DOV7Pe8NMOKw-UM+xe8dYdt5BWA-O9vQ@mail.gmail.com>
 <FB6A886A-9650-407B-9DCD-AD3F9FE9F130@fb.com>
In-Reply-To: <FB6A886A-9650-407B-9DCD-AD3F9FE9F130@fb.com>
From: =?UTF-8?B?R2VvcmdlIExpdSjliJjplKHkvJ8p?= <liuxiwei@inspur.com>
Date: Fri, 21 Dec 2018 15:17:26 +0800
X-Gmail-Original-Message-ID: <CAHkHK0-yV-msA1EHFg-NXwaHWnV3V=xBhZpTRpf_F=EU8_oT=A@mail.gmail.com>
Message-ID: <CAHkHK0-yV-msA1EHFg-NXwaHWnV3V=xBhZpTRpf_F=EU8_oT=A@mail.gmail.com>
Subject: Re: Fan speed control
To: Sai Dasari <sdasari@fb.com>
CC: Vijay Khemka <vijaykhemka@fb.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.30.26.1]
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Dec 2018 07:23:27 -0000

apologize for the late reply, we are planning to write a document for
the fan configuration.


On Wed, Dec 19, 2018 at 1:59 AM Sai Dasari <sdasari@fb.com> wrote:
>
>
>
> =EF=BB=BFOn 12/17/18, 9:47 PM, "openbmc on behalf of George Liu(=E5=88=98=
=E9=94=A1=E4=BC=9F)" <openbmc-bounces+sdasari=3Dfb.com@lists.ozlabs.org on =
behalf of liuxiwei@inspur.com> wrote:
>
>     Hi Vijay
>
>     I am also learning about the fan configuration part of openbmc
>     There is a draft https://github.com/lxwinspur/openbmc-doc.
>     I hope it can be useful for you
> Thanks Geroge! This is great info and hope you can upstream these docs fo=
r ease of finding and greatly benefit other community members.

>     Regards
>
>     -George
>
>     On Tue, Dec 18, 2018 at 7:55 AM Vijay Khemka <vijaykhemka@fb.com> wro=
te:
>     >
>     > Team,
>     >
>     > I am looking for =E2=80=9Cfan speed control=E2=80=9D feature to ena=
ble for Tiogapass. I understand that there are many approaches for this. Pl=
ease point me to all implementation and any details about each approach, ma=
y be some pros and cons.
>     >
>     >
>     >
>     > Regards
>     >
>     > -Vijay
>
>
