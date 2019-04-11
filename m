Return-Path: <wak@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="R9HLq7V5"; 
 dkim-atps=neutral
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ftyg4qnQzDqPK
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 18:11:21 +1000 (AEST)
Received: by mail-lj1-x236.google.com with SMTP id h21so4586748ljk.13
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 01:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gfiRNvxD/s3zS0vNkRaNo7F210Rrcm9HzDM58J/0rQQ=;
 b=R9HLq7V5y7WEETSZ6lvuYf8wL3GjA4XsO248i8PiZwuPXZS7S6WY2CcyBGdqg+s/jB
 g1ctSOjNPN0LIDTAUT2L5tAS8aIzBjKxwWuYhkTNUes15M5FGYFDYuvxuPdwlTsP8XQN
 pMIecLWUAaqWZXRQ5Shzl5VCAuN8V1Ljy400CW0vpV1bAZbtUoNKsArb+EgWbbMwlTpa
 dFL01CPm7fUdps59eBX1RgBjt7FSCBHTIvPU5mdHKIr86HrzvlrjBMzELQHn/bQEYLjj
 7RLIT1/GsJrAmAK8zsOA5vvHDTMmzAGGa/ouN8SIzGrZU50JJ0xszB+a9nW1HMuIg7Bv
 7HVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gfiRNvxD/s3zS0vNkRaNo7F210Rrcm9HzDM58J/0rQQ=;
 b=WpfXnSm/m5xs2dX2reHAO6SHfUSvwXZODI37+JAjd7LhEfeOMCZG+vY1SH1nqXeQgy
 yxKDQdTR+Rq49SY/2gKve6RIpA/WwxbrtvZugcKNduNpGT2fyhOZpNY8P2dVRMJAVum/
 R6Z/PqWOEzQrSOpExFm8yrowriPXDOEuLfi/uRaNhaKDhJxciiyqj7t1pGawbCOhQDCr
 MAVQ/zH4A8OAmO4K2EXgk/CoR8MVOH4rYunFcrwxRPMNWKN60Y6LXae3dDMrGoOpm4PC
 cJFjCEQWVuW+10j6V9s7RBSVhwtvNyUGPByBTOJdu1ODnjUJWIJesY1RZU6oJsBdgO8T
 T4+g==
X-Gm-Message-State: APjAAAVcNDs8WVzLdFIWyfZ9AZFBUOxD4CmxXEjxN/JfPFUR1vFz1HxE
 5QBF3FFbPSyvzB76UDfvpcqPiAkLCt+d0N5SiZ1oNA==
X-Google-Smtp-Source: APXvYqyFTK+qY/859HZCKxo3TaWcfU7XrAbScCTrEeNuBd22ALVzPmI47mcjDhgWv/tq5JU1PyWgcSN+DIuHphsRx0s=
X-Received: by 2002:a2e:22c4:: with SMTP id i187mr25132593lji.94.1554970276119; 
 Thu, 11 Apr 2019 01:11:16 -0700 (PDT)
MIME-Version: 1.0
References: <d27b3022-cf65-80e3-fcea-8e7e9027acaa@linux.vnet.ibm.com>
 <51da69bb-1cfc-fac2-0bad-f0ad5556ffcb@linux.vnet.ibm.com>
In-Reply-To: <51da69bb-1cfc-fac2-0bad-f0ad5556ffcb@linux.vnet.ibm.com>
From: William Kennington <wak@google.com>
Date: Thu, 11 Apr 2019 01:11:04 -0700
Message-ID: <CAPnigKk3frQfFbt8zUtVYaUm5YLPkP1zmnnF36SS0sG=raZNJA@mail.gmail.com>
Subject: Re: Sending the FD over D-bus
To: vishwa <vishwa@linux.vnet.ibm.com>
Cc: Ratan Gupta <ratagupt@linux.vnet.ibm.com>, "Tanous,
 Ed" <ed.tanous@intel.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 11 Apr 2019 08:11:24 -0000

Yes, this is what is being said. d-bus supports this and is based on
http://man7.org/linux/man-pages/man3/cmsg.3.html type of fd passing.
It's not actually the same fd number for both processes, but the
backing resource for the fd is the same.

On Thu, Apr 11, 2019 at 12:52 AM vishwa <vishwa@linux.vnet.ibm.com> wrote:
>
> Unless I am missing something fundamental, are we saying this ?
>
> Process-1:
>
> fd = open(foo);
>
> send(fd) to another process over D-Bus.
>
> -------------------------------
>
> Process-2:
>
> read the "fd" from D-Bus
>
> read(fd,..)
>
> The process-2 would not even have entries in file desc table to map fd.
> So it would return EBADF. If the read succeeds, then it would be a read
> from a locally opened file that returned the same fd number part of open();
>
> !! Vishwa !!
>
> On 4/10/19 3:47 AM, Ratan Gupta wrote:
> > Hi All,
> >
> > As Discussed in yesterday community call, I did some POC to send the
> > unix FD object over the D-Bus.
> >
> > BackGround: We are exploring the possibilities how to send the secrets
> > from one process to other process,
> >
> > a) If the IPC is D-bus
> >
> > b) Calling process doesn't have the root permission to write the
> > secrets in the configuration file.
> >
> > One of the proposal came, Can the calling process  send the unix fd
> > over the D-Bus instead of sending the actual password
> >
> > and receiving process reads the data from the sent fd.?
> >
> > There was a confusion if some other app can snoop the D-bus message
> > and get the FD and read it.I tried to simulate the same
> >
> > behavior in the POC but not sure whether it is correct or not.
> >
> > This POC has two files which is attached with this mail.
> >
> > Dbus-Service(dbus-service-fd-test.py):  Method(readFD) which takes the
> > unix fd as parameter reads it and send the data back
> >
> > Dbus-Client(dbus-client-fd-test.py): Writes dummy data in the file,
> > then opens the file and send the fd over D-bus.
> >
> >
> > After sending the data over D-bus , I introduced a sleep of 15 sec so
> > that I can try to open the same fd from other
> >
> > process,I open the python shell and try to open the shared FD but
> > couldn't open it.
> >
> > Ratan
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
>
