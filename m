Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wMLhH4y6DzDqJ8
 for <openbmc@lists.ozlabs.org>; Tue,  9 May 2017 11:02:55 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3wMLhH2Z0wz9s4s;
 Tue,  9 May 2017 11:02:55 +1000 (AEST)
Subject: Re: [PATCH RFC] Documentation/devicetree: Add specification for FSI
 busses
To: Rob Herring <robh@kernel.org>
References: <1493704508-27119-1-git-send-email-jk@ozlabs.org>
 <20170508144236.r5ezra467hyzebtv@rob-hp-laptop>
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <8570743c-d3cb-9b05-c21a-868bceb7e805@ozlabs.org>
Date: Tue, 9 May 2017 09:02:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170508144236.r5ezra467hyzebtv@rob-hp-laptop>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 09 May 2017 01:02:55 -0000

Hi Rob,

>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/fsi/fsi.txt
>> @@ -0,0 +1,144 @@
>> +FSI bus & engine generic device tree bindings
>> +=============================================
>> +
>> +The FSI bus is probe-able, so Linux is able to enumerate FSI slaves, and
> 
> s/Linux/the OS/

Ah, of course. Will change.

> Otherwise, looks good to me.

OK, I'll roll another revision with the changes mentioned. I also have
the patches that add the DT parsing code to implement this binding.
Those only affect the FSI core, but I'd be keen to include
devicetree@vger in those follow-ups. Any objections?

Cheers,


Jeremy
