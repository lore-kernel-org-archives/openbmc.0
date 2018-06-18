Return-Path: <lee.jones@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:400c:c09::243; helo=mail-wm0-x243.google.com;
 envelope-from=lee.jones@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="AyvmNVa1"; 
 dkim-atps=neutral
Received: from mail-wm0-x243.google.com (mail-wm0-x243.google.com
 [IPv6:2a00:1450:400c:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 418L9r1j7hzF09q
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jun 2018 16:03:12 +1000 (AEST)
Received: by mail-wm0-x243.google.com with SMTP id v16-v6so11945566wmh.5
 for <openbmc@lists.ozlabs.org>; Sun, 17 Jun 2018 23:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=k6bnrIqU2WNDnd0azggyasmPkNN2l3o9lOrxHseHY1I=;
 b=AyvmNVa1V0e1ubyrhHZohwFHp6F9oW/Ji9HeRBcmG1QVq4MDQvcp8HXIg92yjPrKb1
 uGm0V28/h/tb+ZnfO03OAvWlEJk4kKELxWQVqoNAbaDCyxARjlsIwS7DIGsZwFQQM2Bz
 5fEIINC/cEXaH2wuvEX/hHQASybwFMrYSMxTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=k6bnrIqU2WNDnd0azggyasmPkNN2l3o9lOrxHseHY1I=;
 b=V2QTLBYC62+GQiPxgJ9UiBlFMUpg/Au19ny+29pkUP7IXQbgz+1RcPZyMEJru26jgI
 eCjbGgaOoz6F6zMKlJw2xQuAFnS9cu7OStRmZC9ZYYL2df35Ex7kQtfdTBYevpDxdsrn
 LecPYcXPMxVJizLcUkczK39828MSozQXBa7woLe5YVzFvYS8Ua4DVpguUQ3nEUyHpLnC
 0t3d05/6xv4j/y0uEKpy6Kd8fYIWejWKxwM56nKfhDHy4gmRoUPZkGCeB6BUuf0sDvSV
 3/+Yos/FwWx5Ew4UoDEt6t/HO9NWasXPkO9p+oXNEcCUjtXbe66c7F1ewh9BOJ1dLabb
 /CBA==
X-Gm-Message-State: APt69E1lBUBllID+xhvpBn6djEwo44jaVVT38T0hQ5AS5hR1jLoP5RXG
 B7DZEJOUZTKQyHJMh5WR4QN2Nw==
X-Google-Smtp-Source: ADUXVKK/2XoWVeLeUnp/dM0NDZQXEvwtEM7YVe3JmrNNl+crqnRJnkaLs2S79oZV+PVgrEYqT+Iydw==
X-Received: by 2002:a1c:8ec1:: with SMTP id
 q184-v6mr7064435wmd.48.1529301788633; 
 Sun, 17 Jun 2018 23:03:08 -0700 (PDT)
Received: from dell ([95.149.160.78])
 by smtp.gmail.com with ESMTPSA id q17-v6sm15008059wrr.7.2018.06.17.23.03.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 17 Jun 2018 23:03:07 -0700 (PDT)
Date: Mon, 18 Jun 2018 07:03:06 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 James Feist <james.feist@linux.intel.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Joel Stanley <joel@jms.id.au>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: Re: [PATCH linux-next v5 07/13] dt-bindings: mfd: Add a document for
 PECI client mfd
Message-ID: <20180618060306.GD31141@dell>
References: <20180601182216.23894-1-jae.hyun.yoo@linux.intel.com>
 <20180613061637.GI5278@dell>
 <2b5bbf01-8c9c-bb06-4559-00dae61d95de@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b5bbf01-8c9c-bb06-4559-00dae61d95de@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
X-List-Received-Date: Mon, 18 Jun 2018 06:03:12 -0000

On Thu, 14 Jun 2018, Jae Hyun Yoo wrote:

[...]

> > > +Example:
> > > +	peci-bus@0 {
> > 
> > 0?
> > 
> 
> Because the actual reg value of the peci bus is reg = <0x0 0x60> but
> anyway it's an example.
> 
> > > +		#address-cells = <1>;
> > > +		#size-cells = <0>;
> > 
> > No 'reg' property?

0 is fine, but you really should have a 'reg' property.

> This is the actual peci bus node which is a parent of this MFD node:
> 	peci0: peci-bus@0 {
> 		compatible = "aspeed,ast2500-peci";
> 		reg = <0x0 0x60>;
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 		interrupts = <15>;
> 		clocks = <&syscon ASPEED_CLK_GATE_REFCLK>;
> 		resets = <&syscon ASPEED_RESET_PECI>;
> 		clock-frequency = <24000000>;
> 		msg-timing = <1>;
> 		addr-timing = <1>;
> 		rd-sampling-point = <8>;
> 		cmd-timeout-ms = <1000>;
> 	};
> 
> > > +		< more properties >
> > 
> > Remove this.
> 
> I dropped all other properties into < more properties > because I want
> to show the #address-cells and #size-cells to state its sub-nodes
> should have a single unique reg value. Should I remove this line or the
> whole parent node?

Just drop the properties which are unimportant for the example.  You
do not need to replace them with anything, especially with a non-DT
compliant string.

> > > +		peci-client@30 {
> > > +			compatible = "intel,peci-client", "simple-mfd";
> > > +			reg = <0x30>;
> > > +		};
> > > +
> > > +		peci-client@31 {
> > > +			compatible = "intel,peci-client", "simple-mfd";
> > > +			reg = <0x31>;
> > > +		};
> > > +	};
> > 

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
