Return-Path: <avifishman70@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::243; helo=mail-it0-x243.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yoj6Ygia"; 
 dkim-atps=neutral
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 414LyZ2MtVzF3QY
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jun 2018 04:24:37 +1000 (AEST)
Received: by mail-it0-x243.google.com with SMTP id u4-v6so11546616itg.0
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jun 2018 11:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=EIRrKUCuoy62BBZ0NppoxusTJo43weGZNVinmsKVmvM=;
 b=Yoj6Ygiau72n5UcIteFSleE+Z6N88ZAuEmLCRoD5OXkdiG6cCXXgV/2Vu0/srDP/86
 Wthv6egn4scdN5T21x52iTpI8gA/4xrRhGEiEZFM0jm2F7pFwfNXPvTpxiLJagYQ7z+C
 y0wXWs/loYj8RPg9Uur/jWQesl9r5UWRG4qmmbiuk178zyPmFdeVeP8I26eT0sa1PLci
 bk4yaz174aHmjTKn4NCvrSrjFjeS38x1gEoASYrfDz0pXy5Mcmdmkb/EOqL2WDiGvzgT
 MhaehsUXao+9LrDJHJvXXr7FW5MtN019NglzSSddYxOptEsIDv8F6on3QkjgyDWdF8p5
 86qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=EIRrKUCuoy62BBZ0NppoxusTJo43weGZNVinmsKVmvM=;
 b=DLnhVAENIJ9BwNeDUnVImINVyWvYY4A2rLscVEnwIxGkmMwThoYYqTzQXwKYXN7wS4
 NB1RJj5hE7//65Id0SJCMnh7SZ6x9bAzVMcVHG9kbCHg3MODMBLMxInY+bfI44WOsnhA
 VbIHIe0v+ESjJI77QX3J4ltaYVn46FYTx1wKc1I698QGOjPR2uLPSm8glRL+v8zFjMB8
 0i+lM+Jmw18bsuHhw4LxaqogTUFO4G5pjYvEgIsan5SXcg3E2oXSbLOFB/IYppTJOrsA
 TSpBO/iuEGj/IY7bFbdleurbaO9OJT35lBGJ8RJre7S5Zm0LC9wIKbcLzwa9qm9sYtpx
 SeCQ==
X-Gm-Message-State: APt69E08LH3gL+8Km1ruQxBl2n6Az9Lx+pKR8Yo7p1vhy1fRH7tflJF/
 rdHz3YkaYNHVofu8iVtL6YndnqvoFQl2Z9XRiw==
X-Google-Smtp-Source: ADUXVKJjOidjikFxt9DLAh2M1r3AS1FoZ+tFd4V33rXG5wWJbn5tT7fcmd3YW2oGSES4hUz9K0C886B4MXC4IVEGbN8=
X-Received: by 2002:a24:2e43:: with SMTP id i64-v6mr126342ita.0.1528741475786; 
 Mon, 11 Jun 2018 11:24:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:ba01:0:0:0:0:0 with HTTP; Mon, 11 Jun 2018 11:24:35
 -0700 (PDT)
In-Reply-To: <20180611181646.GA5537@rob-hp-laptop>
References: <20180607145821.322979-1-avifishman70@gmail.com>
 <20180607145821.322979-3-avifishman70@gmail.com>
 <20180611181646.GA5537@rob-hp-laptop>
From: Avi Fishman <avifishman70@gmail.com>
Date: Mon, 11 Jun 2018 21:24:35 +0300
Message-ID: <CAKKbWA4gm1x8VazdMjZ6a9bwGmt=_mZYS2S3FnB2x36Ng+cjCQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: usb: new ehci-npcm7xx dt
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>, 
 Tomer Maimon <tmaimon77@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, 
 Brendan Higgins <brendanhiggins@google.com>, mathias.nyman@linux.intel.com, 
 bjorn.andersson@linaro.org, jhogan@kernel.org, albeu@free.fr, 
 chunfeng.yun@mediatek.com, Tony Lindgren <tony@atomide.com>,
 baolu.lu@linux.intel.com, 
 Alex Elder <elder@linaro.org>, Dmitry Osipenko <digetx@gmail.com>, 
 Kate Stewart <kstewart@linuxfoundation.org>, hdegoede@redhat.com, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-usb@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Mark Rutland <mark.rutland@arm.com>, 
 devicetree <devicetree@vger.kernel.org>
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
X-List-Received-Date: Mon, 11 Jun 2018 18:24:39 -0000

On Mon, Jun 11, 2018 at 9:16 PM, Rob Herring <robh@kernel.org> wrote:
> On Thu, Jun 07, 2018 at 05:58:20PM +0300, avifishman70@gmail.com wrote:
>> From: Avi Fishman <AviFishman70@gmail.com>
>>
>> Device Tree documentation for Nuvoton npcm7xx EHCI.
>>
>> Signed-off-by: Avi Fishman <AviFishman70@gmail.com>

Reviewed-by: Rob Herring <robh@kernel.org>
Rob, if I understand you want me to add another version (v5) with the
above line (only on the dt)?

>> ---
>>  Documentation/devicetree/bindings/usb/npcm7xx-usb.txt | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/usb/npcm7xx-usb.txt
>
> Please add acks/reviewed-bys when posting new versions.
>
> Rob
