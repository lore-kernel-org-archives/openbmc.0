Return-Path: <liuxiwei@inspur.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=210.51.26.145; helo=unicom145.biz-email.net;
 envelope-from=liuxiwei@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
X-Greylist: delayed 9804 seconds by postgrey-1.36 at bilbo;
 Tue, 18 Dec 2018 16:46:52 AEDT
Received: from unicom145.biz-email.net (unicom145.biz-email.net
 [210.51.26.145])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Jn8X5B9fzDqT4
 for <openbmc@lists.ozlabs.org>; Tue, 18 Dec 2018 16:46:50 +1100 (AEDT)
Received: from ([218.57.135.44])
 by unicom145.biz-email.net (Antispam) with ASMTP (SSL) id IRM41135
 for <openbmc@lists.ozlabs.org>; Tue, 18 Dec 2018 13:46:35 +0800
Received: from mail-lf1-f48.google.com (172.30.26.1) by
 jtjncas07.home.langchao.com (172.30.26.36) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 18 Dec 2018 13:46:34 +0800
Received: by mail-lf1-f48.google.com with SMTP id z13so11275974lfe.11
 for <openbmc@lists.ozlabs.org>; Mon, 17 Dec 2018 21:46:34 -0800 (PST)
X-Gm-Message-State: AA+aEWa7FwvYhXvnA6lGZijNS7cRy5GLdjTQKuMee1BkcthQ9XWzwCjs
 e/mptcp6aB5qdAF187rtagOQTeB5Bqbl6lI+QCg=
X-Google-Smtp-Source: AFSGD/WvY+bMXYZDARBt4Py24+QWa9qL+aJScwd3X8+iCUnovnNu3xtsy/Ws78HmUaxBjm7AjwVI84jStKC4vVeDBsY=
X-Received: by 2002:ac2:50c4:: with SMTP id h4mr7375526lfm.81.1545111984878;
 Mon, 17 Dec 2018 21:46:24 -0800 (PST)
MIME-Version: 1.0
References: <4E117ED9-B492-4197-A66F-45949E3D7178@fb.com>
In-Reply-To: <4E117ED9-B492-4197-A66F-45949E3D7178@fb.com>
From: =?UTF-8?B?R2VvcmdlIExpdSjliJjplKHkvJ8p?= <liuxiwei@inspur.com>
Date: Tue, 18 Dec 2018 13:46:13 +0800
X-Gmail-Original-Message-ID: <CAHkHK09SisQ0s765c1DOV7Pe8NMOKw-UM+xe8dYdt5BWA-O9vQ@mail.gmail.com>
Message-ID: <CAHkHK09SisQ0s765c1DOV7Pe8NMOKw-UM+xe8dYdt5BWA-O9vQ@mail.gmail.com>
Subject: Re: Fan speed control
To: Vijay Khemka <vijaykhemka@fb.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 18 Dec 2018 05:46:54 -0000

Hi Vijay

I am also learning about the fan configuration part of openbmc
There is a draft https://github.com/lxwinspur/openbmc-doc.
I hope it can be useful for you

Regards

-George

On Tue, Dec 18, 2018 at 7:55 AM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Team,
>
> I am looking for =E2=80=9Cfan speed control=E2=80=9D feature to enable fo=
r Tiogapass. I understand that there are many approaches for this. Please p=
oint me to all implementation and any details about each approach, may be s=
ome pros and cons.
>
>
>
> Regards
>
> -Vijay
