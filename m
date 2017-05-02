Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wHB346rHlzDqBQ
 for <openbmc@lists.ozlabs.org>; Tue,  2 May 2017 16:19:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="a6NH+dE6"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id u70so10935729ywe.1
 for <openbmc@lists.ozlabs.org>; Mon, 01 May 2017 23:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=qZAM0zj1rBiNN7xhgqMTAkFFyiFgRkwuD1qc74pwecc=;
 b=a6NH+dE6ZLuTRCvDHJLYnXffuO/rbj5ORu2RQAvNjwtSbqxqXDQ49UH7Qmys7T1wjJ
 nIUqi803XFklRU15ETZuJgATuehhKgzEUis+QWE8N2V1x6oiqvAGx34PNXMjrb29CRj6
 7iYRYjRphYQhJzIgAwDBDwlylO3lsZ2nuPT5K28VrKrf+GfNYlF7tpHDAVZtYRThiNbn
 TG/MApaZk3cJhkRHNKI6TjoK57hO8kUvX/sQgxOVBEUdmqmeKeTdntKe7NrJXis6kjpG
 XRzWK4mf/ZRm6Yz3i5X+40Yn6+t8kMIKn0qhURfTxntkGUv7aSwCA96s9MK7Cig67ELz
 VUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=qZAM0zj1rBiNN7xhgqMTAkFFyiFgRkwuD1qc74pwecc=;
 b=mGzTefW2AilUyxKcp0v/PgAVLQibcobUmbJ9SuMr26cO93mETIJvxPYPM2zwJddqC6
 TdVTHXjH+miqqedMCYNeTR0nNkyBeJA8ZvysAEVfXmX8jnpvIspszb8cAV0WExG+W+4a
 vInaRFkwzYIft4qGNP2t4q8QbtapYxmMnGZsVC7R0eiaVCG7wOyyjRJN2zLC+8QgeBmk
 tNT5+PFUbVQXbUrBsXPka9qNjRel87+azOU366vUXDTgU1q6tvjFzmRVn4fAoBql8HtT
 SRvljWjSqkgKCdWOkk71fU74TSpstS7Oh1dtBmslSLVys9N/cdJa5HnRs8zIokLOemJc
 zD2w==
X-Gm-Message-State: AN3rC/7A1ena6CSV07beri2AtXUny4STPbmLPvhR4TMBmA2aMLY8lI0F
 vlHdekuXY2k3LUenrReWeq57oeDdnQ==
X-Received: by 10.129.76.19 with SMTP id z19mr3625479ywa.43.1493705982075;
 Mon, 01 May 2017 23:19:42 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Mon, 1 May 2017 23:19:21 -0700 (PDT)
In-Reply-To: <1493704508-27119-1-git-send-email-jk@ozlabs.org>
References: <1493704508-27119-1-git-send-email-jk@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 2 May 2017 15:49:21 +0930
X-Google-Sender-Auth: GMuE2V80lHOZoPU3OOnwND3NvmQ
Message-ID: <CACPK8Xf2regdT4Y-TW4nOc1qYwDcH=zYPRqdjTqL9yvZH49bRA@mail.gmail.com>
Subject: Re: [PATCH RFC] Documentation/devicetree: Add specification for FSI
 busses
To: Jeremy Kerr <jk@ozlabs.org>
Cc: devicetree <devicetree@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 02 May 2017 06:19:45 -0000

On Tue, May 2, 2017 at 3:25 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> This change introduces a proposed layout for describing FSI busses in
> the device tree. While the bus is probe-able, we'd still like a method
> of describing subordinate (eg i2c) busses that are behind FSI devices.
>
> The FSI core will be responsible for matching probed slaves & engines to
> their device tree nodes, so the FSI device drivers' probe() functions
> will be passed a struct device with the appropriate of_node populated
> where a matching DT node is found.
>
> RFC at this stage, so I'd welcome any feedback.
>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

Looks good to me Jeremy. One small question on the description, but
please add Acked-by: Joel Stanley <joel@jms.id.au> to future
revisions.

> ---
>  Documentation/devicetree/bindings/fsi/fsi.txt | 144 ++++++++++++++++++++++++++
>  1 file changed, 144 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fsi/fsi.txt
>
> diff --git a/Documentation/devicetree/bindings/fsi/fsi.txt b/Documentation/devicetree/bindings/fsi/fsi.txt
> new file mode 100644
> index 0000000..b5e85c7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fsi/fsi.txt
> @@ -0,0 +1,144 @@
> +FSI bus & engine generic device tree bindings
> +=============================================
> +
> +The FSI bus is probe-able, so Linux is able to enumerate FSI slaves, and
> +engines within those slaves. However, we have a facility to match devicetree
> +nodes to probed engines. This allows for fsi engines to expose non-probeable
> +busses, which are then exposed by the device tree. For example, a FSI engine

A nit: Can we can expose any device as part of the engine, not just a bus?

> +that is an I2C master - the I2C bus can be described by the device tree under
> +the engine's device tree node.

Cheers,

Joel
