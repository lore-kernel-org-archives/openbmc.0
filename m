Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::22c; helo=mail-it0-x22c.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CHbx7mqP"; 
 dkim-atps=neutral
Received: from mail-it0-x22c.google.com (mail-it0-x22c.google.com
 [IPv6:2607:f8b0:4001:c0b::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40lcQq2Mv5zF2Xx
 for <openbmc@lists.ozlabs.org>; Tue, 15 May 2018 22:32:35 +1000 (AEST)
Received: by mail-it0-x22c.google.com with SMTP id 144-v6so881601iti.5
 for <openbmc@lists.ozlabs.org>; Tue, 15 May 2018 05:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=yNR4eaKa1UeGEZH3UZMGYTNxvE77FOGmJI2ix/qFpuc=;
 b=CHbx7mqP5xRTRa2q5B9kNafsxO2cj9GOa0wQhUTp3qCKKUUr1jz7rN5TwSfhQ0p4R1
 zXRQf9b224hrYSs04R6CSIzS4JgWtgsO6Q3grITIofOGc48nQO+AwjScaKPNM/5axc/A
 XS+jpH6AiPgpg36uA7jNDb9CRaDx6E5viQYIMmetzgZUkAxC5KGLFq6C2jFG+xr7JVwY
 HgS7HrsZdAG9XnjsvQks0YkDFejwgpGnM/9YktsGXeDTv4Jyh1D2JlXsbzEFZJtFe654
 llaBmKWYPuBBt4YteuG/z18CpjLj15ouBHkvYotyt2iJf4FCQN/uOTS3HQyjPXiLb9bz
 6jPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=yNR4eaKa1UeGEZH3UZMGYTNxvE77FOGmJI2ix/qFpuc=;
 b=jDKz6ryy+ZeJZAi3aqRBoHQl0y5DFH45Ht+Rju3a7jySSVRKxC8LzZL7totdifqrCe
 CitwBcOvII98+M3ibiPlwXLLkUs7BrxYIN6jYMarCe7+YyxsBPygY+KnQs7anD1Jt2Xr
 QU2P4cgfoqZlYK9u98I2wjnt9T58r78zmS/MwSMSKIL6QKHz6z+sgNwxsAFUAQEIBP3z
 yiaNtORF6kQ1mRc/N32W4SBLh0FANOdy1PbMHMtoLyANbxMzaxjuZtB6fZkjlAYyrcs3
 dgcfc0yiw3qcY7idy3fSG5KfOWkUSv2dtxpjQgR+pYQ1TYPuFWHNtmc3TYibDObL3HuW
 q+JA==
X-Gm-Message-State: ALKqPwejXuK4SwclfQZSkk3SIrx3Spk2L7z+0l7RIJeAbBI7kfaCXU0t
 9EqmhzO/MgJDDxA7FXM+/QQtTdlduYUtH1m1Tyw=
X-Google-Smtp-Source: AB8JxZpRlPxqTI6kUNlL4PJE+1TcEIckbFe2D8q7nX1AzGv+OX3AL4D6XV/+g3fBdQ/UCsE5gV6fUllS27LrhsnQBHU=
X-Received: by 2002:a24:aa4f:: with SMTP id
 y15-v6mr11412584iti.144.1526387552501; 
 Tue, 15 May 2018 05:32:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:558a:0:0:0:0:0 with HTTP; Tue, 15 May 2018 05:32:31
 -0700 (PDT)
In-Reply-To: <CAD5O4R2j0E-5ROWW=4Zf4TzB428YOwraDvwcCvXJoLoaZ3SsBA@mail.gmail.com>
References: <CAD5O4R24451=iRYh5M_Bokhj8wMAzPdGfj5XSzhU6CJ6cOqotA@mail.gmail.com>
 <1526339800.3484892.1372056960.17AECCFA@webmail.messagingengine.com>
 <CAD5O4R3f1u9Ptk0_rz12teQgmqNkucGpOWmU9EKNBmxdSYAMrg@mail.gmail.com>
 <CAARXrt=Pkddt03EVfwjZN9Qpp8No5LA5X6dqJ+MfU6_K+k-00Q@mail.gmail.com>
 <1526349203.3522551.1372178312.7B38A3F9@webmail.messagingengine.com>
 <CAARXrtkc86rh2WDbK9nAnfY0PPJS2BpSeQSJTLFf3Ccxzc3edQ@mail.gmail.com>
 <CAD5O4R2j0E-5ROWW=4Zf4TzB428YOwraDvwcCvXJoLoaZ3SsBA@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 15 May 2018 20:32:31 +0800
Message-ID: <CAARXrtkovYbEp=F0f1bTJOnVP46TEOfPK7S3DzEO+DQkcEcmbg@mail.gmail.com>
Subject: Re: Question on States monitoring
To: Andres Oportus <andresoportus@google.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 15 May 2018 12:32:36 -0000

> Thanks for info.  It seems that since both monitor and presence are
> subclasses from Evdev they, at least in their current form, need GPIOs to
> be setup as input (in the examples use /dev/input devices) with a driver
> like gpio-keys, is this the case?

Yup, at this level they are the same, using the same driver.
