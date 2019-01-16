Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="dFuGSPyC"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43g3Wh2Rh6zDqN7;
 Thu, 17 Jan 2019 10:36:48 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id y20so9308738qtm.13;
 Wed, 16 Jan 2019 15:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yodGLzKxWdUz0j7H8esGt8ndfcspQtVjzUEk3JYW9D4=;
 b=dFuGSPyCfa4DO+hGtdV8Vjk6UsiF+QcHlJMZH+0+GtQ0iVuJgsVb0gyKVm7au2lB6N
 uug9CwuwFajbvNnGGEzgYlnwhaVNyc2EQ0N0L8MjY6PmnGGLvNG0QLBSfOdrCgirxAHf
 FW7Q63yBI+Ivh501EEpozM451Zx6sXmKLG/iY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yodGLzKxWdUz0j7H8esGt8ndfcspQtVjzUEk3JYW9D4=;
 b=SdTBuqyc5MCx37KcP+mm813Twc2XphkeeM5/h9HPrkql4eQ5e0oYtSet7ssqpr9qh/
 BywL3PCs/fFahN2OyPPCQyETu2bGsoW1yTKd7bLQxH7F/Ge8Mh2zXcQiDc4pzcBQAIWG
 6IGmOlIzrk1+81YAEum5U5yFznFxNcsY5Kj08KRpEjO7c2MR0wmCKcwM75juHLfCrfFa
 at+YIYvQOo2G5btsiIbgBLtoE5h3sGZUfUkXIg50UCRlq6vGPmWHpLHKM0x8W71WKrcZ
 UrJojqDUaf5E/mpiLAzDjDImQyCZ6dPbCe4N3TLhjy4CCRSOKf4s49ROHEUNMdAw2ZuK
 lctQ==
X-Gm-Message-State: AJcUukd8AD7wZvmuaBC3+s9Vu1wnbNPmpxgsi6lStQ28bdEdggUhhH0q
 u4a5NtlsOW5Tuf15k49qBkPNxDkKYaXEXMgzGJM=
X-Google-Smtp-Source: ALg8bN6nfBbWGM7SXOpPwzJ1qG2rSTqm75MsQyuJZdFTGr9z3MnKKDitKWMvU9eRczqBxLBR+KKpHtxo9B0cqnxYP+Q=
X-Received: by 2002:ac8:748:: with SMTP id k8mr9241014qth.235.1547681805428;
 Wed, 16 Jan 2019 15:36:45 -0800 (PST)
MIME-Version: 1.0
References: <CACPK8Xfo5zzyLUa-8fU6j7d5GpVnFea1k3PC93vxiOvYAGV7ZQ@mail.gmail.com>
 <CACPK8Xfxq=df=nW+U57v4vHaJ8B96bi8ABddH_vZNHBBQcLXTA@mail.gmail.com>
 <dd385c02a589f510142dae350b09438c@linux.vnet.ibm.com>
In-Reply-To: <dd385c02a589f510142dae350b09438c@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Jan 2019 10:36:33 +1100
Message-ID: <CACPK8XfiztAE2fasSB+u4YMF8g+s0mHSvmhbdPEprQs6dUmRdw@mail.gmail.com>
Subject: Re: Linux dev-4.19
To: Adriana Kobylak <anoo@linux.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 16 Jan 2019 23:36:50 -0000

On Thu, 17 Jan 2019 at 09:14, Adriana Kobylak <anoo@linux.ibm.com> wrote:
> Would you be updating it with the changes from 4.19? Looking for the
> configs
> that enable NBD snd the vhub device.
> I can submit an update to gerrit just not sure if we just copy the file
> from the kernel repo or only certain changes are added.

As you guessed, it's up to you to submit a change to Gerrit if you
want the defconfig changed. We don't copy the defconfig from the
kernel tree as this contains options relating to testing and
development that we don't enable for the BMC build.

Use menuconfig to enable the option(s), and then savedefconfig to
write out your updated defconfig.

Cheers,

Joel
