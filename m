Return-Path: <wak@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="sbmbx6Um"; 
 dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44f7550QRCzDqHP
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 12:14:14 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id u17so500193lfi.3
 for <openbmc@lists.ozlabs.org>; Tue, 09 Apr 2019 19:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=syeWmbWum193A/2qdqig/+kbQsDdc9UZydkqikMQdL8=;
 b=sbmbx6UmF0r8u2cq20OhoIekt2TzNRYWrS55vh6D027cSK6sTRzYn5ENtpHgSSfdk/
 lSYHJUZP7WtLbFNxrzIS23lTYsTvqn8L9y0Py6GB0J5D4DLbdfHuCLaJuGyTWPg4A8xL
 VK/UcpY+um7lgEo2N6wr3J3SDlULM2exf7+6yyNI1/vP40GuB8I5B0EiltngSIesm6CI
 aQF1F0oOOZ1qEyVDFt8f9HPFBbhoD1ClvRKxD48+fxZOzGSVSXWwnfbO0k7s6ZcKTRyg
 cP1rirm4fEwc8eyqRFenRFcMEmtkjf028A5RAd7lG/XTvOsokdLpJ/xxpPGMhvDgrInl
 mI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=syeWmbWum193A/2qdqig/+kbQsDdc9UZydkqikMQdL8=;
 b=m9xNgFs8tOvGtIOcYUWSSc8b7AfrdGRwPM0tF4VLO4+KQ6sE16xteiE5Tg3GYDlRkf
 aLhhJPZkgPxrgAOzTeJnIRpM+ynIi10iOMhSODc7fj/8Bxb+kf3lpEJj8Z0fW320aC8a
 +WiNyA1t34EfRZ5TxncMv8oc0000Z0+M0pRzzI21BmVsp/5AyDsUF+085PzL14T3BNz5
 qC59ITEqkr6UVnt8LLYSFivQ14qpCBRFT131ZnJgcuF14i2yqZjyrnb5uz/QewNKHXG8
 bHcqT148cHrbSyDFuO34yxzcv0DJT4DSCjjVV2kYpChjIa2OGQiQE7f3F9T3iwm4muGH
 eaXQ==
X-Gm-Message-State: APjAAAUXIa8UBhdU0sODb381vRg06NI3wbnW23KYQEA+RZv7DLM/QSWx
 VBSFtw+u9SL+aWhcZdF96/pboYbRaB1C9JoQyjMTvA==
X-Google-Smtp-Source: APXvYqyAoXTgQCErNyfFEdE60f5yVK1prELEURSCu82hClTxD0gcG7pe4PjKJlHKGeGkfpNzciDL3x49sGeFG1CPGr4=
X-Received: by 2002:ac2:55a3:: with SMTP id y3mr15718072lfg.79.1554862447280; 
 Tue, 09 Apr 2019 19:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <d27b3022-cf65-80e3-fcea-8e7e9027acaa@linux.vnet.ibm.com>
In-Reply-To: <d27b3022-cf65-80e3-fcea-8e7e9027acaa@linux.vnet.ibm.com>
From: William Kennington <wak@google.com>
Date: Tue, 9 Apr 2019 19:13:56 -0700
Message-ID: <CAPnigKkHnc_zWQDw2XzgUdGLn2rUar7tgwuXsh4rO6L7vCiJ6g@mail.gmail.com>
Subject: Re: Sending the FD over D-bus
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Cc: "Tanous, Ed" <ed.tanous@intel.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
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
X-List-Received-Date: Wed, 10 Apr 2019 02:14:18 -0000

What is the issue with just sending them over d-bus? The only party
that can view the messages outside of the normal unicast partner is
the dbus-broker process. You are still trusting the dbus-broker in the
file descriptor case. On top of that you are probably still trusting
the mapper to give you the correct service name prior to sending the
secrets.

On Tue, Apr 9, 2019 at 12:49 PM Ratan Gupta <ratagupt@linux.vnet.ibm.com> wrote:
>
> Hi All,
>
> As Discussed in yesterday community call, I did some POC to send the
> unix FD object over the D-Bus.
>
> BackGround: We are exploring the possibilities how to send the secrets
> from one process to other process,
>
> a) If the IPC is D-bus
>
> b) Calling process doesn't have the root permission to write the secrets
> in the configuration file.
>
> One of the proposal came, Can the calling process  send the unix fd over
> the D-Bus instead of sending the actual password
>
> and receiving process reads the data from the sent fd.?
>
> There was a confusion if some other app can snoop the D-bus message and
> get the FD and read it.I tried to simulate the same
>
> behavior in the POC but not sure whether it is correct or not.
>
> This POC has two files which is attached with this mail.
>
> Dbus-Service(dbus-service-fd-test.py):  Method(readFD) which takes the
> unix fd as parameter reads it and send the data back
>
> Dbus-Client(dbus-client-fd-test.py): Writes dummy data in the file, then
> opens the file and send the fd over D-bus.
>
>
> After sending the data over D-bus , I introduced a sleep of 15 sec so
> that I can try to open the same fd from other
>
> process,I open the python shell and try to open the shared FD but
> couldn't open it.
>
> Ratan
>
>
>
>
>
>
>
>
>
>
>
>
