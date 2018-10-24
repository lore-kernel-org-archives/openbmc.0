Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="QawusFz1"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42g0mr6shNzDrGC
 for <openbmc@lists.ozlabs.org>; Wed, 24 Oct 2018 17:32:44 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id l41-v6so4491682qtl.8
 for <openbmc@lists.ozlabs.org>; Tue, 23 Oct 2018 23:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Nzches855ZQOh9Bs/VBvsgqk5nU7WMJUgx5hoYC3VM=;
 b=QawusFz1Ii0VC+aTNfCIyfKphW5QiM1cU8vcU/jTKXDTBWTIttTuWaTmKtcO78mshx
 ESGcularrdmJYCYdyb+fWoM2mNoeV+aNWlhVns/xz5phOLKG2IYYAuJsjyhbGPjWTD9/
 K4ZNdfJEqa6SMx70fwm0l2Ig+pG0YfhDLzuPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Nzches855ZQOh9Bs/VBvsgqk5nU7WMJUgx5hoYC3VM=;
 b=TLzfOvRI7VGdJn4INB96m/yIfhuYNF4oFIoeQaBL7IQImLCpZX5Ekg3G+14HUVsNiC
 Rsl+sHrslGc3p1ioGRq2k8rQQa9xJfYAXoq+xyGQQhIscOmbhHSHhhPXCzdbvRBMEY+/
 yq5T/vv9cfocOfQRPo87NwAKqTQe9pvoaLklYwUU5QL+pEdU4keKimCy+982V3HKEOwd
 ZzZztpL/gUmNjO+rn6WwaCeEtKrb3DQr3i9B+Gd+BWArGS6VkYimN61riRhfT+GMA3I1
 hGhWFi7H+6JNjhyOjKsnTv8BFs0hNNwKI8g8UCiWnoilNlRzhLjwVgHsvLA+cXaT6znL
 sDbg==
X-Gm-Message-State: AGRZ1gKnxRDYClCzkrX2X+hEOuj0valyY9hRSKu02BjJTJGFff0fXpuS
 cwUsftQy0bIDIiYEknTjAPfqnVwf0IQczo13O1s=
X-Google-Smtp-Source: AJdET5fdtzwygeHSLqQRBXth/mOaBK4KXrdMZsmfuHVGjI4pAaG+cDNkl3mZujw180LlOqkou1TxCuAt/qOXXIx/F7Y=
X-Received: by 2002:a0c:a425:: with SMTP id w34mr1241531qvw.160.1540362762251; 
 Tue, 23 Oct 2018 23:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_51B7EBE8401F35B41849FB95@qq.com>
In-Reply-To: <tencent_51B7EBE8401F35B41849FB95@qq.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 24 Oct 2018 17:02:30 +1030
Message-ID: <CACPK8XcJfjHsVxo5ksEE-4h0Xr7bzAzMsyFrMwOqtrrfUSpDGw@mail.gmail.com>
Subject: Re: VHUB didn't work on AST2500
To: 1450335857@qq.com, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: a.filippov@yadro.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 24 Oct 2018 06:32:45 -0000

On Wed, 24 Oct 2018 at 17:00, xiuzhi <1450335857@qq.com> wrote:
>  I am porting obmc-ikvm to my hardware platform. The host screen can be seen by vncviewer , but the mouse and keyboard didn't work on AST2500
> . Only the keys ';' , 'Enter',  '1','2','3','4' work. others keyinput will deadlock the host screen .
> The kernel error log:
> [   99.326586] configfs-gadget gadget: high-speed config #1: c
> [   99.403704] aspeed_vhub 1e6a0000.usb-vhub: status direction mismatch
> [   99.492831] aspeed_vhub 1e6a0000.usb-vhub: status direction mismatch
> The kernel version is : video-dev5,
> commit 2acbc35adcfe15971b701770e1105276a18da9f7
>
> Who can give me some suggestions to  debug it?

Ben, do you have any advice?
