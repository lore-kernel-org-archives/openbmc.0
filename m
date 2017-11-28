Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::234; helo=mail-lf0-x234.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="a4tu8mUN"; 
 dkim-atps=neutral
Received: from mail-lf0-x234.google.com (mail-lf0-x234.google.com
 [IPv6:2a00:1450:4010:c07::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ym7Vn19qZzDrPk
 for <openbmc@lists.ozlabs.org>; Tue, 28 Nov 2017 13:52:16 +1100 (AEDT)
Received: by mail-lf0-x234.google.com with SMTP id i14so35229580lfc.1
 for <openbmc@lists.ozlabs.org>; Mon, 27 Nov 2017 18:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=0FL4h1jDAitiJ4CIOj8bHKEeE5bJcdezIwQq/SWfxfc=;
 b=a4tu8mUNMP5LRnRp+P5WlPqK4emF9/h1HPwsuvyW9E96vGAuorN1S+ume9TyRicmsT
 EJBIdU4BKk0QZzSeFE/7p6thUtZmECec+LdmntH5gSNjU6Tr0oNl/h7XaNoRG0swR7rU
 hyC711YPvEa3Ycb41Da3JIVETGCEd5irJx3JIpSEAHidMKdz6Cjy5/zPYaVH1Q09K4QF
 AU1TAm+i4aTgtCbxms4GHkbbwVBE3Fmhun9iMkcIJ34LNkWidgPIiNVos20j8PCMZvTW
 j+L0xZ3Ez1Ke/NVGEVB+pjCvhlvdChbGxde4Vn7p81f7qCnUKLdaXo04ptJa71o7xoar
 I75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=0FL4h1jDAitiJ4CIOj8bHKEeE5bJcdezIwQq/SWfxfc=;
 b=k+Kp70bp5Naq3UNA3Fk1gpfhJ/dSepbRVHuC1gy8E0LkYrKR1fCzJPk1OiAlGTw7/X
 Ib1avPw3Am89bf/0TXOgCksGjuJ/PSzm4sO/wQTSkRiSR9LJOyeGQn21nd0uxG75liI+
 PfpoP4har/5GbMFumKI5g7PdL/R/Y86CUPurKxTphu01ARx7i+iyelse8KbG9vaDiz7S
 xfeTs8qkV4OM1zoYp/jhD2zpFqfkJVsDDZ1H4Z7o1krT0/2F6fDwojSl34tcycqt4qEG
 W5Xv987GNu/vqsmwHpcWFTmAq5FPqcKgTXPKcoRH13sCNsvjFQPcwZSvkk3OlRdygbJC
 g2RA==
X-Gm-Message-State: AJaThX78e7T823h/Rcw0w+wTGOAPvAhtV/Q+oLk+0rf/6QrO1CwGljrh
 L/Halu1PEFdMGFBy8EeOUvpm3RnZxhs9wLP76XU=
X-Google-Smtp-Source: AGs4zMbqh2OEzpjSukoKXn8XjqMQa/K2/APiTVWFTCKSbIDN0JM9JxztIDAZf8j5SWDYXe9DFzUpyipw/d71GbirIV8=
X-Received: by 10.46.56.8 with SMTP id f8mr16218817lja.46.1511837533708; Mon,
 27 Nov 2017 18:52:13 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Mon, 27 Nov 2017 18:51:53 -0800 (PST)
In-Reply-To: <CAO=notxMHYoZgxBJQpXOoP=TxcZFXJaNjFw=uFnw=4R9zyxSzQ@mail.gmail.com>
References: <CAO=notyW=x_9j45SDd-75WULwXQdTHhUx65R7YUUSgaBp2+qgQ@mail.gmail.com>
 <CACPK8Xcv8F4WHs8bynxDSLK6pg4hYTm2w-044RmJ6dOEcYevJA@mail.gmail.com>
 <CAO=notxMHYoZgxBJQpXOoP=TxcZFXJaNjFw=uFnw=4R9zyxSzQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 28 Nov 2017 13:21:53 +1030
X-Google-Sender-Auth: cbVVTKV_M0Cm2EllIUBxbIezY_s
Message-ID: <CACPK8XfKf1j3vWL7huG8xPoYgM5RMP3MQE6j7FUv1iDTLD-Bwg@mail.gmail.com>
Subject: Re: Linux 4-10 v 4.13 patching
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Nov 2017 02:52:18 -0000

On Tue, Nov 28, 2017 at 1:19 PM, Patrick Venture <venture@google.com> wrote:
> Thanks.  When sending to both, do I need to send a patch for each,
> dev-4.10, dev-4.13 in the header or is it better to not specify the
> branch in this case?
>
> On Mon, Nov 27, 2017 at 6:39 PM, Joel Stanley <joel@jms.id.au> wrote:
>> On Tue, Nov 28, 2017 at 1:52 AM, Patrick Venture <venture@google.com> wrote:
>>> I'm sorry as I probably missed the email, should I send patches
>>> against linux 4.10 or 4.13 or both?

If you send two mails then it will be easiest for me to track. I'd
vote for this.

If you think that will get too spammy, then just specify the branches
you want them applied to in your cover letter.

Cheers,

Joel
