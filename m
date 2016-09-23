Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x243.google.com (mail-ua0-x243.google.com
 [IPv6:2607:f8b0:400c:c08::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sgPmF2gLWzDsmC
 for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2016 17:16:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=a+/FeIhR; 
 dkim-atps=neutral
Received: by mail-ua0-x243.google.com with SMTP id 51so1081666uac.1
 for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2016 00:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=YEXzvFemPEyltIJNIqsOxd3jwTwlteoh/v+YprRhcN8=;
 b=a+/FeIhRJfQBPzg2lba9aa7Oh50QhEVwCI05wjDgB8vJTTxNI3H9fLkSNDhjWvqc1E
 qNOsixz+Tj8WLGysI/D707YLIQ3vKYjbUICss5H+eEu4FHolL5POBjR18TmJ2CPRDlz4
 /19BaifvSOZnlnmd/DOHeMjFAAeqayciDuRHrHZ3qrSzS5LduYIau0eTGoHAcyxDR5m0
 rdZpLKwHFMKFqUW9cHP0M4qxfRSaSZYDalmvRTOL6DBsBRzx37Kk2RXmv63GpiJxEptF
 pSUB8iJYscvfQMppVVUY4dT9jwJbNasAIH8fbEUQnb/eMSNK4my9dNj92tcmEk8bDsOe
 w53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=YEXzvFemPEyltIJNIqsOxd3jwTwlteoh/v+YprRhcN8=;
 b=eky60Qk7+WN3LqcAK+vKbNS8QTCf7+ordWrd8rn3hhnlEZ7TnyB2onRDQlxh4uneog
 Mi9h/2Biu9UBJUUREO7gozI74Zn5sdRxW/k1A7LaQh/E8qezFKGszYrzPlrtt39YQhOR
 pCCfuytP+MRpuWZJ9eQGhQV8EPLzFK62v/Ceuw14tSrhJ2/NiSWzJniv7Olh0lXlH5rW
 BUnHpEr5ug+wsD0N+VKEjT/XQJHHHWEjP2CsCcuKmnhO69lZfhCktcdf2OjMMj3EVfzJ
 M+iPsNCek6okx39InNQCv4EVnI/2iYHVexH8I2zMXG4rGO4u7d9RNf2NLuXkGVr28kur
 FrQw==
X-Gm-Message-State: AE9vXwPYfl8U4T9tp+hhwG9fAPl/iceX7/d21ZjAJEuglmtOg3Ie2Aw5hL8OlU6tHizolNMd0Dz1cQLWnDLq2Q==
X-Received: by 10.159.36.177 with SMTP id 46mr3360599uar.78.1474614971474;
 Fri, 23 Sep 2016 00:16:11 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Fri, 23 Sep 2016 00:15:49 -0700 (PDT)
In-Reply-To: <1474058133-27363-12-git-send-email-tpearson@raptorengineering.com>
References: <1474058133-27363-1-git-send-email-tpearson@raptorengineering.com>
 <1474058133-27363-12-git-send-email-tpearson@raptorengineering.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 23 Sep 2016 16:45:49 +0930
X-Google-Sender-Auth: 1ossknADpPvn4dkTS0g6Gcn7zAk
Message-ID: <CACPK8XfjU7XB=Zp=9ZT2CxudDs9tDAY7eLCW5WXwukexoq=A_g@mail.gmail.com>
Subject: Re: [PATCH 11/17] Add missing UARTs to Firestone DT
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Sep 2016 07:16:13 -0000

On Sat, Sep 17, 2016 at 6:05 AM, Timothy Pearson
<tpearson@raptorengineering.com> wrote:
> Firestone has two additional UARTs.  One is the rear panel
> RS-232 serial port, and another is an internal TTL port.
>
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>

Applied to dev-4.7 as 7b57dfe39d113a776a359226cf7a173d55cd6966.

Cheers,

Joel
