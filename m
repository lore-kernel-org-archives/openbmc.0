Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="LZEtv0OV"; 
 dkim-atps=neutral
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42YGW44cJGzF0RH
 for <openbmc@lists.ozlabs.org>; Mon, 15 Oct 2018 09:30:56 +1100 (AEDT)
Received: by mail-qt1-x835.google.com with SMTP id o17-v6so19561627qtr.1
 for <openbmc@lists.ozlabs.org>; Sun, 14 Oct 2018 15:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nPBfUbpa+vug7UorFQyBTj7WjWFKfaWNuWJvCIrmkUs=;
 b=LZEtv0OVq+TxZke3U/NtWVNFFS+Jh6eth1ApVPbgPVcj0j51kJAZE7MVnB927BVY7O
 fWEHNguPjA2b6+wL442YTL5Jgklvu7Msi9ujykHd4NsiRfW85jcRR0ouBgyeisPCYN0s
 BNy5Dch1DbmWrWwElP+4s1ulqPau0WZZJUUvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nPBfUbpa+vug7UorFQyBTj7WjWFKfaWNuWJvCIrmkUs=;
 b=Pdb6frKS/q+HFQzjdnyPSEcicm8b4HZDVa/Vb0UUVxFT3KA99+TMVpSNOKRGlA3YPK
 wbOMxP75qi+1dxrplp1c+SqBRUWs3KdY0HYr4Bp3KHBZ30WVwQ9LRrAST3Amh3P+mr3H
 JUkKTaCIQyeWEtiAa9Gt7MEUcT2AK1zupgd1TdKoQnYcLATkDWdg5KpootipgXB+3WYT
 wD7Da88s9VlQG2NP1Tx04xBsMmuwE4GOuZ5istletqEy95tm446GgENzFfNsckmMcYoF
 AkjOPAg8x9v1sgnLrBqV4ARwbpyKIh4DswbS6JBafChTit9jBSWgbC2yuqguOP0McRG/
 f/bg==
X-Gm-Message-State: ABuFfohF79pbIWRPLeR99+lhON/hCcMaTxa6Y/i9lXSiLlOlMsI77dd8
 RZk35x5eEFm8MrjN/GAWVMPX6fuihcXeDfNwS3k4ew==
X-Google-Smtp-Source: ACcGV61cZlb5WckkU2nakQmOLBepXOv6GwffxEONqkM9KgzjsdBDS62jUBu1DU/jj8SO2S4IOr4mkLyqK0nNGTsVXWE=
X-Received: by 2002:ac8:48d9:: with SMTP id
 l25-v6mr13876474qtr.235.1539556253669; 
 Sun, 14 Oct 2018 15:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <b955c4bf-7605-945d-c7dd-ac3669809cee@linux.vnet.ibm.com>
In-Reply-To: <b955c4bf-7605-945d-c7dd-ac3669809cee@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 15 Oct 2018 09:00:42 +1030
Message-ID: <CACPK8XeEsHjAYsd58PmALBXkdH6qm=9u1jLCo4V=Re=WQkRO1w@mail.gmail.com>
Subject: Re: Should we tag master?
To: gmills@linux.vnet.ibm.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Sun, 14 Oct 2018 22:30:58 -0000

On Sun, 14 Oct 2018 at 07:39, Gunnar Mills <gmills@linux.vnet.ibm.com> wrote:
>
> I think we should tag in the next week or two with a v2.4.

Yes please!
