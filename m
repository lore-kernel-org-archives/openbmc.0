Return-Path: <clg@kaod.org>
Received: from 18.mo4.mail-out.ovh.net (18.mo4.mail-out.ovh.net
 [188.165.54.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tS5nD0NjGzDvjf
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 23:38:07 +1100 (AEDT)
Received: from player750.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id E304C1EECB
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 13:38:04 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player750.ha.ovh.net (Postfix) with ESMTPSA id B6A1A180073;
 Mon, 28 Nov 2016 13:38:03 +0100 (CET)
Subject: Re: [PATCH qemu 26/38] aspeed/sdmc: fake a few more registers to let
 DRAM calibration run
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-27-git-send-email-clg@kaod.org>
 <1480298571.2503.70.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <3d787171-1f72-bc31-83a1-4615a2b79909@kaod.org>
Date: Mon, 28 Nov 2016 13:38:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1480298571.2503.70.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 2678515878879660802
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeeigdegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 28 Nov 2016 12:38:08 -0000

> +    case R_CONF:
> +    case R_GRAPHIC_MEM_PROT:
> +    case R_REFRESH_TIMING:
> +    case R_AC_TIMING1:
> +    case R_AC_TIMING2:
> +    case R_CQDQS_DELAY_CTRL:
> +    case R_MCLK_CALIB_STATUS:
> +    case R_DQS_INPUT_CALIB_STATUS:
> +    case R_MCR24:
> +    case R_MODE_SETTING_CTRL:
> +    case R_MRS_MODE_SETTING_CTRL:
> +    case R_EMRS_MODE_SETTING_CTRL:
> +    case R_POWER_CTRL:
> +    case R_PAGE_MISS_MASK:
> +    case R_MAX_GRANT_LEN1:
> +    case R_MAX_GRANT_LEN2:
> +    case R_MAX_GRANT_LEN3:
> +    case R_MAX_GRANT_LEN4:
> +    case R_IRQ_STATUS_CTRL:
> +    case R_ECC_PROTECT:
> +    case R_MCR58:
> +    case R_IO_BUFFER_MODE:
> +    case R_DLL_CTRL:
> +    case R_DLL_CTRL2:
> +    case R_DDR_IO_IMPEDANCE_CTRL:
> +    case R_START_ADDR_LEN:
> +    case R_FAIL_DQ:
> +    case R_TEST_INIT_VALUE:
> +    case R_DQ_DELAY_CALIB_CTRL2:
> +    case R_DQ_DELAY_CALIB_CTRL3:
> +    case R_CK_DUTY_VALUE:
> +    case R_COMPAT_SCU_PASSWORD:
> +    case R_COMPAT_SCU_MPLL:
> +    case R_COMPAT_SCU_HW_STRAPPING:
> 
> This is a lengthy list of registers. What are your thoughts about using
> numeric range values with comments?
> 
>  case 0x08 ... 0x38: /* GFX memprotect, refresh timings ... */
>  case 0x40 ... 0x58: /* grant length registers, ... */
>  ...
>   val = s->regs[addr];
>   break;

yes. This is better. Adding the full list is not really useful. 
I think we should only be interested in the limited set of 
registers the model fakes. I was thinking also keeping the 
patch for later when we add AST2500 "support".

Thanks,


C.
 
> Either way I'm probably not fussed, but I'm interested in your
> thoughts.
> 
> This addresses my comment on the previous patch, but it would be good
> not to break the SDMC commit-to-commit.


> Andrew
> 
>> +        val = s->regs[addr];
> +        break;
> +    case R_DQ_DELAY_CALIB_CTRL1:
> +        val = s->regs[addr] | DQ_DELAY_CALIB_COUNT_DONE;
> +        break;
> +    case R_ECC_STATUS_CTRL:
> +        val = s->regs[addr] | ECC_TEST_FINISH;
> +        break;
>      default:
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "\n",
> @@ -133,6 +283,42 @@ static void aspeed_sdmc_write(void *opaque, hwaddr addr, uint64_t data,
>              g_assert_not_reached();
>          }
>          break;
> +    case R_GRAPHIC_MEM_PROT:
> +    case R_REFRESH_TIMING:
> +    case R_AC_TIMING1:
> +    case R_AC_TIMING2:
> +    case R_CQDQS_DELAY_CTRL:
> +    case R_MCLK_CALIB_STATUS:
> +    case R_DQS_INPUT_CALIB_STATUS:
> +    case R_MCR24:
> +    case R_MODE_SETTING_CTRL:
> +    case R_MRS_MODE_SETTING_CTRL:
> +    case R_EMRS_MODE_SETTING_CTRL:
> +    case R_POWER_CTRL:
> +    case R_PAGE_MISS_MASK:
> +    case R_MAX_GRANT_LEN1:
> +    case R_MAX_GRANT_LEN2:
> +    case R_MAX_GRANT_LEN3:
> +    case R_MAX_GRANT_LEN4:
> +    case R_IRQ_STATUS_CTRL:
> +    case R_ECC_PROTECT:
> +    case R_MCR58:
> +    case R_IO_BUFFER_MODE:
> +    case R_DLL_CTRL:
> +    case R_DLL_CTRL2:
> +    case R_DDR_IO_IMPEDANCE_CTRL:
> +    case R_ECC_STATUS_CTRL:
> +    case R_START_ADDR_LEN:
> +    case R_FAIL_DQ:
> +    case R_TEST_INIT_VALUE:
> +    case R_DQ_DELAY_CALIB_CTRL1:
> +    case R_DQ_DELAY_CALIB_CTRL2:
> +    case R_DQ_DELAY_CALIB_CTRL3:
> +    case R_CK_DUTY_VALUE:
> +    case R_COMPAT_SCU_PASSWORD:
> +    case R_COMPAT_SCU_MPLL:
> +    case R_COMPAT_SCU_HW_STRAPPING:
> +        break;
>      default:
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
> @@ -221,6 +407,8 @@ static void aspeed_sdmc_reset(DeviceState *dev)
>      default:
>          g_assert_not_reached();
>      }
> +
> +    s->regs[R_MCLK_CALIB_STATUS] = MCLK2X_PHASE;
>  }
>  
>  static void aspeed_sdmc_realize(DeviceState *dev, Error **errp)
> diff --git a/include/hw/misc/aspeed_sdmc.h b/include/hw/misc/aspeed_sdmc.h
> index a4415d9efc2f..e073a6c9419a 100644
> --- a/include/hw/misc/aspeed_sdmc.h
> +++ b/include/hw/misc/aspeed_sdmc.h
> @@ -14,7 +14,7 @@
>  #define TYPE_ASPEED_SDMC "aspeed.sdmc"
>  #define ASPEED_SDMC(obj) OBJECT_CHECK(AspeedSDMCState, (obj), TYPE_ASPEED_SDMC)
>  
> -#define ASPEED_SDMC_NR_REGS (0x8 >> 2)
> +#define ASPEED_SDMC_NR_REGS (0x174 >> 2)
>  
>  typedef struct AspeedSDMCState {
>      /*< private >*/
> 
