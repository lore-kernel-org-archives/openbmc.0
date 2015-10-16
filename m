Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C1D5C1A09E4
 for <openbmc@lists.ozlabs.org>; Sat, 17 Oct 2015 04:30:32 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445016626191505.0935170757998;
 Fri, 16 Oct 2015 10:30:26 -0700 (PDT)
Date: Fri, 16 Oct 2015 12:30:24 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH ipmi-fru-parser v3 1/4] Checking in the basic IPMI FRU
 Parser Library. Parser has just enough intelligence to parse Chassis, Board
 & Product info areas. No support for multi-record in this version. This
 parser is a stripped down version of the parser in the FreeIPMI
 distribution.
Message-ID: <20151016173024.GE13316@asimov.austin.ibm.com>
References: <1444999069-20975-1-git-send-email-patches@stwcx.xyz>
 <1444999069-20975-2-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1444999069-20975-2-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_8
X-ZohoMail-Owner: <20151016173024.GE13316@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 32.97.110.55
X-Zoho-Virus-Status: 2
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Oct 2015 17:30:34 -0000

Please fix up the commit message to be properly formed.  It is extremely
long right now.  Below is a link to good practices [1].

On Fri, Oct 16, 2015 at 07:37:46AM -0500, OpenBMC Patches wrote:
> From: Hariharasubramanian R <hramasub@in.ibm.com>
> 
> ---
>  Makefile |  19 ++
>  frup.c   | 599 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 618 insertions(+)
>  create mode 100644 Makefile
>  create mode 100644 frup.c
> 
> diff --git a/Makefile b/Makefile
> new file mode 100644
> index 0000000..cf75af3
> --- /dev/null
> +++ b/Makefile
> @@ -0,0 +1,19 @@
> +CXX ?= $(CROSS_COMPILE)g++
> +
> +IPMI_FRU_PARSER_LIB = libifp.so
> +IPMI_FRU_PARSER_OBJS = frup.o
> +
> +INC_FLAGS += $(shell pkg-config --cflags --libs libsystemd) -I. -O2 --std=gnu++11
> +LIB_FLAGS += $(shell pkg-config  --libs libsystemd) -rdynamic
> +#IPMID_PATH ?= -DHOST_IPMI_LIB_PATH=\"/usr/lib/host-ipmid/\" 
> +
> +all: $(IPMI_FRU_PARSER_LIB)
> +
> +%.o: %.c
> +	$(CXX) -fpic -c $< $(CXXFLAGS) $(INC_FLAG) $(IPMID_PATH) -o $@
> +
> +$(IPMI_FRU_PARSER_LIB): $(IPMI_FRU_PARSER_OBJS)
> +	$(CXX) $^ -shared $(LDFLAGS) $(LIB_FLAGS) -o $@
> +
> +clean:
> +	rm -f $(IPMI_FRU_PARSER_OBJS) $(IPMI_FRU_PARSER_LIB)

Please clean up this makefile.  Looks like you copied it from the ipmid.
At least the commented out IPMID_PATH isn't needed.

[1] https://wiki.openstack.org/wiki/GitCommitMessages
-- 
Patrick Williams
