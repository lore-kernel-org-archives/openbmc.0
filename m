Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AOqpYqTY"; 
 dkim-atps=neutral
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 440cK75XNpzDqX8
 for <openbmc@lists.ozlabs.org>; Fri, 15 Feb 2019 00:13:31 +1100 (AEDT)
Received: by mail-ot1-x332.google.com with SMTP id 98so10428870oty.1
 for <openbmc@lists.ozlabs.org>; Thu, 14 Feb 2019 05:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DI6Yn4FahJm3NR4lvZSVkUokDPvltpN/uKL7lfmOe2w=;
 b=AOqpYqTYtH5jzvooWU0XNiONosPhJfb+6oJmrM9kT+E/PlFZvzi3Qx8Pq7aFe2hmrV
 hHts4zy//jiolJDxi9KSM84TZ3v1pxYWJZpiDmvlYpGClic/VG3+d7p/KlmROFymIESY
 /S5pAaahijtcIbliVY2CPDA/MpVWvbN/X6k6Ok2fku9qwY3q67QqbE8AihqqaiqFVBpS
 sInNIJxpFZmi4wTcmMHFyovkSgrMAVszaNlqhfhKhEQG63HIHiZxaSEiRQqD4s3A/wJ4
 yH9kqX/7yjFHEXifo47gYgNXd2E7eG3gS1KBd9f1VFfA5GM+RNuNNYno3CgNtrXYyA1X
 6UDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DI6Yn4FahJm3NR4lvZSVkUokDPvltpN/uKL7lfmOe2w=;
 b=rA9Ksj8lopPzWRJ8ferzl+x0gXV2TOpVePIkNApjxPhxZvxBTAH6icV3xVutjY0Kx6
 jONN0I2+vtdtVYkQjO2UQRaxPOZzgz4MASBH3dmSJifZ5+4eZupCB9lLI2ic3TKlnuOq
 NSuLcDRYDDKbKmhYtn3KxIV6j+K2nTmR49Ptt5zc12qxBQ0FOYKDw3ssyVbZOpavrYvs
 HNxrGb0+UDR1rGnZYi/4LgbDvTb2xCCvH/MRZxcHCcmKjV+T89NdRggZdgowd42RXqSh
 5HsJudyrX3Z/fEjGivLM8RWrDtvNHHhQ+Mjyk2jJwdWvmvTq/gbBV9E+rIUZprc8zvz3
 jnPQ==
X-Gm-Message-State: AHQUAuaOTo2wXcCi2TN1vzhb98QBuuDL8pjbXH7thIFBDggxESHE1bZ0
 D2eaYEE73b7sSKcETz1yKmHZFLhd31SgVy5aakY=
X-Google-Smtp-Source: AHgI3IbLPlT+8wBAhxMwLt9xPJ4SWRjz5T5W8jxdm2LMOVptou2iPuBhMEYi8DahT1l4DV225xED4fuLC6Ko5yLh7vA=
X-Received: by 2002:a9d:7493:: with SMTP id t19mr2176257otk.98.1550150009054; 
 Thu, 14 Feb 2019 05:13:29 -0800 (PST)
MIME-Version: 1.0
References: <CAARXrtmBsbJt7n_wmpg3nadtoJuz0bqbT9d9ijKL8bDTu+k+WA@mail.gmail.com>
 <CACPK8Xd-OX_zQtn5rtfRw+rXB+783hQSwc_PTmzMYr=SHaP5Tg@mail.gmail.com>
 <CAARXrtnjhLDez0vjXOxMGgNeNXPTZCBZZBa6Kk+U9=tkRJoKgg@mail.gmail.com>
In-Reply-To: <CAARXrtnjhLDez0vjXOxMGgNeNXPTZCBZZBa6Kk+U9=tkRJoKgg@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 14 Feb 2019 07:13:13 -0600
Message-ID: <CALLMt=q_Pb=TpzR353dTMyP=cpkf9FPJCFiSxu+Q3_ntK5no2Q@mail.gmail.com>
Subject: Re: Romulus to use Virtual PNOR
To: Lei YU <mine260309@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 14 Feb 2019 13:13:32 -0000

On Wed, Feb 13, 2019 at 9:03 PM Lei YU <mine260309@gmail.com> wrote:
>
> Based on the discussion, let's keep using static flash layout for PNOR on
> Romulus.
>
> This brings the questions:
> 1. Shall we move the legacy code update service
>    (org.openbmc.control.Flash.service) to the new one
>    (xyz.openbmc_project.Software.xxx.service)?

Yes please. I asked Adriana to open a story to track doing this. I'm
working on getting
firmware update support in Redfish and I'd like to just use the
xyz.openbmc_project.Software.xxx interfaces for both BMC and Bios updates.
Some day these xyz.openbmc_project.Software.xxx would also be used for
updates to power supplies and other devices in the system as well via
the Redfish UpdateService.

> 2. How do we plan to support PNOR version, image verification for static flash
>    layout?
