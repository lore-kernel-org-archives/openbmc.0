Return-Path: <jandraara@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c35; helo=mail-yw1-xc35.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lCEYqmGU"; 
 dkim-atps=neutral
Received: from mail-yw1-xc35.google.com (mail-yw1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44DN3S4XG1zDqCw
 for <openbmc@lists.ozlabs.org>; Wed,  6 Mar 2019 03:42:28 +1100 (AEDT)
Received: by mail-yw1-xc35.google.com with SMTP id s204so7460513ywg.2
 for <openbmc@lists.ozlabs.org>; Tue, 05 Mar 2019 08:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Hfmy6pSlkNV82SHpRZlYTKF2RBGTzT+28+pTMl/3oQA=;
 b=lCEYqmGUSXYymySigdiRMlHyFCM9OpGA0RReI3L2j2bih4xGdR/uX8VeqDk4PZjlJ+
 OCzPDxj0vVVfqwlHS2PAnp0zIwqPRI6SK6yxLaDZSzAH1jePItXlrVV44dvreFKjVYoB
 Qcsh4EZRIBcgHWDqtWiQYa/mh909IlC0Bl+PWyx3/KUJ4lDThfeyj2d0naYaK+rw5WRS
 hJ4zb7HOS9pwcXSUaLBZRy1zQxunYgHfyczS9UwfcQnk/ip5D4mwqc5HzhV/d99q6qfG
 jDPSSPZhFsbOACTJSkkeJHrc8nZsQ+WUC5e8D5PX5NBEr6bMe5zxYMqjVcNE3MviruAM
 hxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Hfmy6pSlkNV82SHpRZlYTKF2RBGTzT+28+pTMl/3oQA=;
 b=iyhrK2JV5emEHBjPnzFljUYujWkfvP4CP0hVrYGcA/nU00gFUUZwq74oRTRVqEQdXi
 7NnzpdQoDyf4BvO6fuDrGhnlcOwF7lpA0b6CyVY55p2aLXo42Bq9OFv808iXqDFQI/jf
 rtUAM7ydFNRqxOyjpZTDAL2xvHtfxU+iiEjBdThNETysFwdbRtAQTm+2/jv8CYu5sZn3
 nyK7eaMlKgNGmnREjffGoYY9poI7BopvTNgpPNZ/HAkFvE0ickqxOOFRWuVDSfbzHC5j
 oDRL2kH4cDJmlPuMB9oHRmOKaRFGa9J4hhM7YLy27LJFiwQqyv8bD/wDsqiqp9/1FDD3
 P+eQ==
X-Gm-Message-State: APjAAAUVfwPp43+NzpfexCYUoNfgRSKkM1NGnWJvkOmz/vV0abMhgroZ
 kJV79E2qC2sS+k0KNVRSPB8Dw/sosNtUHYg9YA0=
X-Google-Smtp-Source: APXvYqwr0LATBh+iZ4ILTimqiq7IG8bimGTKgOHw4KK7eSWTqkK2/vFKMZtt/Ui6RfV0OwgTD76+ykAigxrynhosCRs=
X-Received: by 2002:a81:d55:: with SMTP id 82mr1776079ywn.278.1551804144768;
 Tue, 05 Mar 2019 08:42:24 -0800 (PST)
MIME-Version: 1.0
References: <CAMTupoSj09Tq=1hfdEsQBJi_aO=TVY00Qs1CC3zrmZP2R-o2FQ@mail.gmail.com>
 <CAARXrt=ebgO7sPOWJa_XUR48qcX+K74kTEqz=iNSd46kALjtyw@mail.gmail.com>
In-Reply-To: <CAARXrt=ebgO7sPOWJa_XUR48qcX+K74kTEqz=iNSd46kALjtyw@mail.gmail.com>
From: Jandra A <jandraara@gmail.com>
Date: Tue, 5 Mar 2019 10:42:13 -0600
Message-ID: <CAMTupoS0xXGV_mqtWXK2xcy0u6B5JpfzedBnYLSLUzDSA0-TCQ@mail.gmail.com>
Subject: Re: NTP Servers - Should a reboot be required?
To: Lei YU <mine260309@gmail.com>
Cc: vishwa <vishwa@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 05 Mar 2019 16:42:29 -0000

> In OpenBMC's time manager, a requirement is that time setting changes sha=
ll
not be applied until host is off, see [special-note-on-host-on][1]

Are there other thoughts on this? Perhaps someone who was at the demo
can shed light on this...

On Thu, Feb 28, 2019 at 8:15 PM Lei YU <mine260309@gmail.com> wrote:
>
> On Fri, Mar 1, 2019 at 6:19 AM ja az <jandraara@gmail.com> wrote:
> >
> > Hi all,
> >
> > During the Demo and Retrospective call last week, the UI design team
> > showed the current proposals for the Date and Time Settings panels. As
> > it stands, the backend has been developed in way such that any changes
> > in the synchronized NTP servers would require the host to be off in
> > order for the changes to go into effect. If the host is not off, a
> > reboot is required. And so, the UI designs were created to represent
> > this. When they were shown last week, there was hesitation regarding
> > the need for a reboot; some gave the example of changing the date on
> > their laptop and how that doesn=E2=80=99t require a reboot.
> >
> > Are there resources to modify the backend so that a reboot is not
> > required? Is that possible even if there were resources?
>
> This is really a good question.
> In OpenBMC's time manager, a requirement is that time setting changes sha=
ll
> not be applied until host is off, see [special-note-on-host-on][1]
>
> @Vishwa could you kindly help to describe the reason (or history) of the
> requirement?
>
> [1]: https://github.com/openbmc/phosphor-time-manager#special-note-on-hos=
t-on
