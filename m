Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::22c; helo=mail-qt0-x22c.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dn7vEAOZ"; 
 dkim-atps=neutral
Received: from mail-qt0-x22c.google.com (mail-qt0-x22c.google.com
 [IPv6:2607:f8b0:400d:c0d::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zLcrG73FwzDqlG
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2018 04:38:06 +1100 (AEDT)
Received: by mail-qt0-x22c.google.com with SMTP id d4so19217691qtj.5
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jan 2018 09:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=nc7xPFLrB3X3sEbp6HzLeNxomRLPxpuSi1YfqNbRivU=;
 b=Dn7vEAOZZioyFdIl+n31K1kvRXHAVfnf/SVj44vYAPq0joLlM4LF3qOa5QlBswjPcs
 HmsF0uLt4fP53Yzl8QKMwPi31Q3Jdt9wGlXhtLZb90wde/92dkRtnLV8Xs8sq8uVcTtu
 qYkW7l/nurgGwgy4jyRQEcVhv5xStBvwMJLflIa0ePWNUSfL2gOQQLZh5Wsn5dG6jnAD
 QB415pxXo5RuboQYzUin9RkNSugqdAi5AlpQ/S4yYorklK0/Nx28EFgCtqf9KWnE4zw6
 WK5eTPdKF8ALHo1fIWwmSFYXMA7J5IdsrcRsD224boOxZli/2t5PZgnoCrhmXy9XEczL
 lwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=nc7xPFLrB3X3sEbp6HzLeNxomRLPxpuSi1YfqNbRivU=;
 b=lOjVw8xNFXQL2Q+iBTPzHxHEm0OYPUgDjXFTI+r5d6dMX36KkZowPysIBjxeQFuIqU
 IX4e6T6fR4283s2109pesEAMGOJHSvtpEUA1TmLQqBDelFHQ+VU4qcSP2sSMDsuigBE2
 1sFFvnoJ5Cfr3g2KyPARDY6wzvANREzBLpPV+lUcvFm3Yr64a6NwNAInEjTPJg82G2/+
 +MXEzLpFhaewCVBl7zMuNKAG6tckq99xWCUlCuxjr2ZlhKAX8IiuqvQrCtB2JVZGs2Fd
 Kjgss99Nbm9O9vbPSRTukCeqgm2Vf4bNCzK8Fo5lF5RXwg8KD/EAmmsXO/1+84XONtaY
 cMVA==
X-Gm-Message-State: AKwxytds8HFxJ2kfBQ1pz/VkPSeuF34yazob6niWir0SwGd0cWcTj8FC
 S7iAgiI+lJZzgxTEMtPsTlD0U5az4qPFNw2gqqQ=
X-Google-Smtp-Source: ACJfBosepcZ9PoaPwH59LS05W6Ly6Jt2KEupsfMCYwPhiDQtAdRriySJpXQTpRF83mw4At0I+xntnqv6Jhw1+fJ5RJ8=
X-Received: by 10.237.50.135 with SMTP id z7mr15080519qtd.249.1516124283921;
 Tue, 16 Jan 2018 09:38:03 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.29.9 with HTTP; Tue, 16 Jan 2018 09:37:43 -0800 (PST)
In-Reply-To: <1515696437-10508-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1515696437-10508-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 16 Jan 2018 11:37:43 -0600
X-Google-Sender-Auth: EQPFFCQuFgqf9_e4XwqPragx2fA
Message-ID: <CACPK8XfktaijUe7i5kV27ce3ZpWvZiKtUPPTPuqLHhh-ErZN2g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 0/5] hwmon (pmbus): cffps: reset to
 linux-next state
To: Eddie James <eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 16 Jan 2018 17:38:08 -0000

On Thu, Jan 11, 2018 at 12:47 PM, Eddie James
<eajames@linux.vnet.ibm.com> wrote:
> This series brings the IBM common form factor power supply driver to the
> commits accepted into linux-next. It also includes two changes to the pmbus
> core driver, also in linux-next. One is required for cffps, the other is a
> bug fix for pmbus page number.
>
> Eddie James (5):
>   hwmon: (pmbus/core) Prevent unintentional setting of page to 0xFF
>   hwmon: (pmbus) cffps: Add PMBUS_SKIP_STATUS_CHECK
>   hwmon: (pmbus) Export pmbus device debugfs directory entry
>   hwmon: (pmbus) cffps: Add debugfs entries
>   hwmon (pmbus): cffps: Add led class device for power supply fault led

Merged to 4.10.

Congrats on getting these upstream first!

Cheers,

Joel
