Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x242.google.com (mail-ua0-x242.google.com
 [IPv6:2607:f8b0:400c:c08::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tRxFK1734zDsgy
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 17:13:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rYvH+IoP"; 
 dkim-atps=neutral
Received: by mail-ua0-x242.google.com with SMTP id 50so9129041uae.2
 for <openbmc@lists.ozlabs.org>; Sun, 27 Nov 2016 22:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=6Hpps0brXiYsAFfZHb4C840FEuaZPt6FDcAMSmiNI+k=;
 b=rYvH+IoPnF++9wsBYGzj7lAEKgy0crR+MftFGE6oViUGBI7mhyiZyI6pHDuEnoWGrR
 WI7NW4jZ1KMW5DPqC2K3WxvUskP21Yr7pmaAYiO/WtqYFtKQkO54no87rAVjx3Teu/EQ
 WAfaCuog+lbA2lfUI2vwqo7P9YiGNFltqkhigc6mjoqPC35wIjLcEoMKNvGUXkvsrOCO
 3DvZ3oH9yHmRJFPfFH84vZVpet8z5A2PKri7sh1ljQqsmFsMSy230QidZ4ne7dc8fWaj
 RsFCb1fbKLQbIy7i9oMWoRiSQVIZh3fEvaFJRXd6nA++BphQOA7InUKcnd7/g4EeIjFI
 cLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=6Hpps0brXiYsAFfZHb4C840FEuaZPt6FDcAMSmiNI+k=;
 b=Hiexhj458ikR8i6jXlxMFvXvWZovlqt6UfCDfJYiUNuPzVS96J5ppcMB4Iox8gPEXZ
 zoZeRSjbLjc61tdRPrzfV1q5nnUctJfqtM87XJ5yXjJ97gKus8q2nktOkgjGlpB00o96
 rbzjOKAJ/xbdRlBc4jaIWLnJw+jVaqb6mU4eQgsZq5L8kYz1vGpRfJriugftu7scL4Ji
 K1K7LSvUAdJfctJyi/7r3KlGWfa5XIsS2wY5c09U7cpegzbwhfI0v1ecPt/l1gsxezCv
 I/LAQGwkx1ls6CRLfuw730JrcyGdS04UdhCZ0wBXxw3OqJJSqaYwjCcysEbeisDXYFM4
 Jzog==
X-Gm-Message-State: AKaTC03xE9dwwSuN3dtU0pAkHCIaQ0UI5hPMknWiLbhxQm+4jmSapO17T41IaUF5A4GzhdmAmRRTNsQl0Uoq+w==
X-Received: by 10.176.84.207 with SMTP id q15mr12202498uaa.177.1480313602575; 
 Sun, 27 Nov 2016 22:13:22 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.0.193 with HTTP; Sun, 27 Nov 2016 22:13:02 -0800 (PST)
In-Reply-To: <1479979610-2958-3-git-send-email-jaghu@google.com>
References: <1479979610-2958-1-git-send-email-jaghu@google.com>
 <1479979610-2958-3-git-send-email-jaghu@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 28 Nov 2016 16:43:02 +1030
X-Google-Sender-Auth: Ep5iFvnBrZ6NC0HkeXoub7IYOb4
Message-ID: <CACPK8XceGn6MRdR6ntMte1MA3HZA5C0Y_vDZYCUP=9bMwOeHWw@mail.gmail.com>
Subject: Re: [PATCH linux v3 2/3] drivers: hwmon: Hwmon driver for ASPEED
 AST2400/2500 PWM support
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
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
X-List-Received-Date: Mon, 28 Nov 2016 06:13:26 -0000

Hello Jaghu,

This is looking better. I have some more comments below.

On Thu, Nov 24, 2016 at 7:56 PM, Jaghathiswari Rankappagounder
Natarajan <jaghu@google.com> wrote:

> +The ASPEED AST2400/2500 PWM controller supports 8 PWM output ports.
> +PWM clock types M, N and 0 are three types just to have three independent PWM
> +sources. Each port can be assigned a different PWM clock type.

I suggest you describe the types.

And add some newlines between your paragraphs to make it easier to read.

> +The device driver matches on the device tree node. The configuration values
> +are read from the device tree and written to the respective registers.
> +The driver provides a sysfs entry "pwm1" through which the user can
> +configure the duty-cycle value (ranging from 0 to 255; 255 is 100 percent).
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index d4de8d5..7f75b01 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -341,6 +341,19 @@ config SENSORS_ASB100
>           This driver can also be built as a module.  If so, the module
>           will be called asb100.
>
> +config SENSORS_ASPEED_PWM
> +       tristate "ASPEED AST2400/AST2500 PWM driver"
> +       help
> +         This driver provides support for ASPEED AST2400/AST2500 PWM
> +         controller and output ports. The ASPEED PWM controller can support 8
> +         PWM outputs. PWM clock types M, N and 0 are three types just to have three
> +         independent PWM sources. Each could be assigned to the 8 PWM port
> +         with its own settings. The user can configure duty cycle through
> +         the exposed hwmon sysfs entry "pwm".
> +
> +         This driver can also be built as a module.  If so, the module
> +         will be called aspeed-pwm.

Make sure you test the code both as a module and built in to the kernel.

> +
> +struct aspeed_pwm_port_data {
> +       u8 pwm_port;
> +       u8 pwm_enable;
> +       u8 pwm_type;
> +       u8 pwm_fan_ctrl;
> +       void __iomem *base;
> +};
> +
> +enum pwm_clock_type { TYPEM, TYPEN, TYPEO };
> +
> +struct pwm_clock_type_params {
> +       u32 l_value;
> +       u32 l_mask;
> +       u32 h_value;
> +       u32 h_mask;
> +       u32 unit_value;
> +       u32 unit_mask;
> +       u32 ctrl_reg_offset;

ctrl_reg or even just ctrl will do.

> +};
> +

I think this is an improvement on the duplicated swtich statements we
had before. Do you agree?

I'm wondering if there are still ways to clean up. The mask and the
value both tell us where in the register each value needs to go;
perhaps we can only include one of them in the pwm_clock_type_params?

> +static const struct pwm_clock_type_params pwm_clock_type_params[] = {
> +       [TYPEM] = {
> +               .l_value = ASPEED_PTCR_CLK_CTRL_TYPEM_L,
> +               .l_mask = ASPEED_PTCR_CLK_CTRL_TYPEM_L_MASK,
> +               .h_value = ASPEED_PTCR_CLK_CTRL_TYPEM_H,
> +               .h_mask = ASPEED_PTCR_CLK_CTRL_TYPEM_H_MASK,
> +               .unit_value = ASPEED_PTCR_CLK_CTRL_TYPEM_UNIT,
> +               .unit_mask = ASPEED_PTCR_CLK_CTRL_TYPEM_UNIT_MASK,
> +               .ctrl_reg_offset = ASPEED_PTCR_CLK_CTRL,
> +       },
> +       [TYPEN] = {
> +               .l_value = ASPEED_PTCR_CLK_CTRL_TYPEN_L,
> +               .l_mask = ASPEED_PTCR_CLK_CTRL_TYPEN_L_MASK,
> +               .h_value = ASPEED_PTCR_CLK_CTRL_TYPEN_H,
> +               .h_mask = ASPEED_PTCR_CLK_CTRL_TYPEN_H_MASK,
> +               .unit_value = ASPEED_PTCR_CLK_CTRL_TYPEN_UNIT,
> +               .unit_mask = ASPEED_PTCR_CLK_CTRL_TYPEN_UNIT_MASK,
> +               .ctrl_reg_offset = ASPEED_PTCR_CLK_CTRL,
> +       },
> +       [TYPEO] = {
> +               .l_value = ASPEED_PTCR_CLK_CTRL_TYPEO_L,
> +               .l_mask = ASPEED_PTCR_CLK_CTRL_TYPEO_L_MASK,
> +               .h_value = ASPEED_PTCR_CLK_CTRL_TYPEO_H,
> +               .h_mask = ASPEED_PTCR_CLK_CTRL_TYPEO_H_MASK,
> +               .unit_value = ASPEED_PTCR_CLK_CTRL_TYPEO_UNIT,
> +               .unit_mask = ASPEED_PTCR_CLK_CTRL_TYPEO_UNIT_MASK,
> +               .ctrl_reg_offset = ASPEED_PTCR_CLK_CTRL_EXT,
> +       }
> +};
> +
> +enum pwm_port { PWMA, PWMB, PWMC, PWMD, PWME, PWMF, PWMG, PWMH };
> +
> +struct pwm_port_params {
> +       u32 pwm_en;
> +       u32 ctrl_reg_offset;
> +       u32 pwm_type_part1;
> +       u32 pwm_type_part2;
> +       u32 pwm_type_mask;
> +       u32 duty_ctrl_rise_point;
> +       u32 duty_ctrl_fall_point;
> +       u32 duty_ctrl_reg_offset;
> +       u8 duty_ctrl_calc_type;
> +};
> +
> +static const struct pwm_port_params pwm_port_params[] = {
> +       [PWMA] = {
> +               .pwm_en = ASPEED_PTCR_CTRL_PWMA_EN,
> +               .ctrl_reg_offset = ASPEED_PTCR_CTRL,
> +               .pwm_type_part1 = ASPEED_PTCR_CTRL_SET_PWMA_TYPE_PART1,
> +               .pwm_type_part2 = ASPEED_PTCR_CTRL_SET_PWMA_TYPE_PART2,
> +               .pwm_type_mask = ASPEED_PTCR_CTRL_SET_PWMA_TYPE_MASK,
> +               .duty_ctrl_rise_point = DUTY_CTRL_PWM1_RISE_POINT,
> +               .duty_ctrl_fall_point = DUTY_CTRL_PWM1_FALL_POINT,
> +               .duty_ctrl_reg_offset = ASPEED_PTCR_DUTY0_CTRL,
> +               .duty_ctrl_calc_type = 0,
> +       },
> +
> +static inline void
> +aspeed_pwm_write(void __iomem *base, u32 val, u32 reg)
> +{
> +       writel(val, base + reg);

Is there a reason you're using writel and not iowrite32?

> +}
> +
> +static inline u32
> +aspeed_pwm_read(void __iomem *base, u32 reg)
> +{
> +       u32 val = readl(base + reg);
> +       return val;

You could just do return readl(base + reg).

That said, do you think the helpers for _read and _write are worth it?

> +}
> +
> +static void
> +aspeed_set_pwm_clock_enable(void __iomem *base, bool val)

Most kernel code puts the type and storage class specifiers on the
same line as the function:

static void aspeed_set_pwm_clock_enable(void __iomem *base, bool val)

> +{
> +       u32 reg_value = aspeed_pwm_read(base, ASPEED_PTCR_CTRL);
> +
> +       if (val)
> +               reg_value |= ASPEED_PTCR_CTRL_CLK_EN;
> +       else
> +               reg_value &= ~ASPEED_PTCR_CTRL_CLK_EN;
> +
> +       aspeed_pwm_write(base, reg_value, ASPEED_PTCR_CTRL);
> +}
> +
> +static void
> +aspeed_set_pwm_clock_source(void __iomem *base, bool val)

When I call this function I'm going to write something like this:

aspeed_set_pwm_clock_source(foo, true);

It doesn't make sense to be setting a clock source to "true". I think
you could call it aspeed_pwm_use_pclk() or similar, so the boolean
makes sense.

> +{
> +       u32 reg_value = aspeed_pwm_read(base, ASPEED_PTCR_CTRL);
> +
> +       if (val)
> +               reg_value |= ASPEED_PTCR_CTRL_CLK_SRC;
> +       else
> +               reg_value &= ~ASPEED_PTCR_CTRL_CLK_SRC;
> +
> +       aspeed_pwm_write(base, reg_value, ASPEED_PTCR_CTRL);
> +}
> +
> +static void
> +aspeed_set_pwm_clock_division_h(void __iomem *base, u8 pwm_clock_type,
> +               u8 div_high)
> +{
> +       u32 reg_offset = pwm_clock_type_params[pwm_clock_type].ctrl_reg_offset;
> +       u32 reg_value = aspeed_pwm_read(base, reg_offset);
> +
> +       reg_value &= ~pwm_clock_type_params[pwm_clock_type].h_mask;
> +       reg_value |= div_high << pwm_clock_type_params[pwm_clock_type].h_value;
> +
> +       aspeed_pwm_write(base, reg_value, reg_offset);
> +}
> +
> +static void
> +aspeed_set_pwm_clock_division_l(void __iomem *base, u8 pwm_clock_type,
> +               u8 div_low)
> +{

You could pass around a pointer to the clock type, instead of the index.

Even better would be some kind of struct that includes both base and
the clock type.

> +       u32 reg_offset = pwm_clock_type_params[pwm_clock_type].ctrl_reg_offset;
> +       u32 reg_value = aspeed_pwm_read(base, reg_offset);
> +
> +       reg_value &= ~pwm_clock_type_params[pwm_clock_type].l_mask;
> +       reg_value |= div_low << pwm_clock_type_params[pwm_clock_type].l_value;
> +
> +       aspeed_pwm_write(base, reg_value, reg_offset);
> +}

Is there ever a case where you will set the high but not the low bit?
If not you could do this:

aspeed_set_pwm_clock_division(void __iomem *base, u8 pwm_clock_type,
u8 div_low, u8 div_high)
{
       struct pwm_clock_type *pwm = &pwm_clock_type_params[pwm_clock_type];
       u32 reg = aspeed_pwm_read(base, pwm->ctrl_reg_offset);

       reg &= ~(pwm->l_mask | pwm->h_mask);
       reg |= (div_low << pwm->l_value) | (div_high << pwm->h_value);

       aspeed_pwm_write(base, reg, pwm->ctrl_reg_offset);
}

I suggest attempting cleanups like this to other parts of your code.

> +
> +static void
> +aspeed_set_pwm_clock_unit(void __iomem *base, u8 pwm_clock_type,
> +               u8 unit)
> +{
> +       u32 reg_offset = pwm_clock_type_params[pwm_clock_type].ctrl_reg_offset;
> +       u32 reg_value = aspeed_pwm_read(base, reg_offset);
> +
> +       reg_value &= ~pwm_clock_type_params[pwm_clock_type].unit_mask;
> +       reg_value |= unit << pwm_clock_type_params[pwm_clock_type].unit_value;
> +
> +       aspeed_pwm_write(base, reg_value, reg_offset);
> +}
> +

> +static void
> +aspeed_set_pwm_fan_ctrl(struct aspeed_pwm_port_data *priv, u8 fan_ctrl)
> +{
> +       u16 period;
> +       u16 dc_time_on;
> +
> +       period = aspeed_get_pwm_clock_unit(priv, priv->pwm_type);
> +       period += 1;
> +       dc_time_on = (fan_ctrl * period) / PWM_MAX;
> +
> +       if (dc_time_on == 0) {
> +               aspeed_set_pwm_enable(priv, 0);

Doesn't aspeed_set_pwm_enable take a boolean as the second parameter?

> +       } else {
> +               if (dc_time_on == period)
> +                       dc_time_on = 0;
> +
> +               aspeed_set_pwm_duty_rising(priv, 0);
> +               aspeed_set_pwm_duty_falling(priv, dc_time_on);
> +               aspeed_set_pwm_enable(priv, 1);
> +       }
> +}
> +
> +static ssize_t
> +set_pwm(struct device *dev, struct device_attribute *attr, const char *buf,
> +               size_t count)
> +{
> +       struct aspeed_pwm_port_data *priv = dev_get_drvdata(dev);
> +       u8 fan_ctrl;
> +       int ret;
> +
> +       ret = kstrtou8(buf, 10, &fan_ctrl);

If you specify 0 as the format, then users can pass their clock rate
in as hexadecimal (not that it would make much sense...) or decimal
and the sysfs file will do the correct thing.

> +       if (ret)
> +               return -EINVAL;
> +
> +       if (fan_ctrl < 0 || fan_ctrl > PWM_MAX)
> +               return -EINVAL;
> +
> +       if (priv->pwm_fan_ctrl == fan_ctrl)
> +               return count;
> +
> +       priv->pwm_fan_ctrl = fan_ctrl;
> +       aspeed_set_pwm_fan_ctrl(priv, fan_ctrl);
> +
> +       return count;
> +}
> +
> +static ssize_t
> +show_pwm(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +       struct aspeed_pwm_port_data *priv = dev_get_drvdata(dev);
> +
> +       return sprintf(buf, "%u\n", priv->pwm_fan_ctrl);
> +}
> +
> +static SENSOR_DEVICE_ATTR(pwm1, S_IRUGO | S_IWUSR, show_pwm, set_pwm, 0);
> +
> +static struct attribute *pwm_dev_attrs[] = {
> +       &sensor_dev_attr_pwm1.dev_attr.attr,
> +       NULL,
> +};
> +
> +ATTRIBUTE_GROUPS(pwm_dev);
> +
> +static int
> +aspeed_create_pwm_port(struct device *dev, struct device_node *child,
> +               void __iomem *base)
> +{
> +       struct device *hwmon;
> +       u8 val;
> +       struct aspeed_pwm_port_data *priv;
> +
> +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       hwmon = devm_hwmon_device_register_with_groups(dev, "aspeed_pwm",
> +                                                     priv, pwm_dev_groups);
> +       if (IS_ERR(hwmon)) {
> +               dev_err(dev, "Failed to register hwmon device\n");
> +               return PTR_ERR(hwmon);
> +       }
> +       priv->base = base;
> +
> +       of_property_read_u8(child, "pwm_port", &val);
> +       priv->pwm_port = val;
> +
> +       of_property_read_u8(child, "pwm_enable", &val);
> +       priv->pwm_enable = val;
> +       aspeed_set_pwm_enable(priv, val);
> +
> +       of_property_read_u8(child, "pwm_type", &val);
> +       priv->pwm_type = val;
> +       aspeed_set_pwm_type(priv, val);
> +
> +       of_property_read_u8(child, "pwm_fan_ctrl", &val);
> +       priv->pwm_fan_ctrl = val;
> +       aspeed_set_pwm_fan_ctrl(priv, val);
> +
> +       return 0;
> +}
> +
> +/*
> + * If the clock type is type M then :
> + * The PWM frequency = 24MHz / (type M clock division L bit *
> + * type M clock division H bit * (type M PWM period bit + 1))
> + * Calculate type M clock division L bit and H bits given the other values
> + */
> +static bool
> +set_clock_values(u32 pwm_frequency, u32 period, u8 type, void __iomem *base)
> +{
> +       u32 src_frequency = 24000000;

Where does this come from? It's the pclk I think. This means your
binding should do something like this:

  clocks = <&clk_apb>;

Then in your code,

pclk = devm_clk_get(&pdev->dev, NULL);
pclk_rate = clk_get_rate(pclk);

and then use clck_rate where you have 'src_frequency' to calculate the
divisor values. A hwmon driver that does this is g762.c.

> +       u32 divisor = src_frequency / pwm_frequency;
> +       u32 clock_divisor = divisor / (period + 1);
> +       u32 tmp_clock_divisor;
> +       u8 low;
> +       u8 high;
> +       u32 calc_high;
> +       u32 calc_low;
> +
> +       for (high = 0; high <= MAX_HIGH_LOW_BIT; high += 1) {
> +               for (low = 0; low <= MAX_HIGH_LOW_BIT; low += 1) {
> +                       calc_high = 0x1 << high;
> +                       calc_low = (low == 0 ? 1 : (2 * low));
> +                       tmp_clock_divisor = calc_high * calc_low;
> +                       if (tmp_clock_divisor >= clock_divisor)
> +                               goto set_value;
> +               }
> +       }
> +
> +       return false;
> +
> +set_value:
> +       aspeed_set_pwm_clock_division_h(base, type, high);
> +       aspeed_set_pwm_clock_division_l(base, type, low);
> +       aspeed_set_pwm_clock_unit(base, type, period);
> +
> +       return true;
> +}
> +
> +static int
> +aspeed_pwm_probe(struct platform_device *pdev)
> +{
> +       u32 period;
> +       struct device_node *np, *child;
> +       struct resource *res;
> +       void __iomem *base;
> +       bool success;
> +       struct clk *typem_clk, *typen_clk, *typeo_clk;
> +       u32 pwm_typem_freq, pwm_typen_freq, pwm_typeo_freq;
> +       int err;
> +
> +       np = pdev->dev.of_node;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (res == NULL)
> +               return -ENOENT;
> +
> +       base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
> +       if (!base)
> +               return -ENOMEM;
> +
> +       /* Enable PWM clock */
> +       aspeed_set_pwm_clock_enable(base, 1);

You're passing a '1' to a function that expects a boolean value.

> +       /* Select clock source as 24MHz */
> +       aspeed_set_pwm_clock_source(base, 0);

This would be selected by your device tree bindings. You could have it
so if a clock node is populated, it uses that value, and if it's not
it falls back on the 1MHz clock.

> +
> +       typem_clk = of_clk_get(np, 0);

This isn't what I meant. See the comment above about referencing the
parent clock in the bindings.

> +       if (!IS_ERR(typem_clk))
> +               pwm_typem_freq = clk_get_rate(typem_clk);
> +       else
> +               return -EINVAL;
> +
> +       typen_clk = of_clk_get(np, 1);
> +       if (!IS_ERR(typen_clk))
> +               pwm_typen_freq = clk_get_rate(typen_clk);
> +
> +       typeo_clk = of_clk_get(np, 2);
> +       if (!IS_ERR(typeo_clk))
> +               pwm_typeo_freq = clk_get_rate(typeo_clk);

This doesn't make any sense. Did you test this code?

> +
> +       err = of_property_read_u32(np, "pwm_typem_period", &period);
> +       if (!err) {
> +               success = set_clock_values(pwm_typem_freq, period, TYPEM, base);
> +               if (!success)
> +                       return -EINVAL;
> +       } else {
> +               return -EINVAL;
> +       }
> +
> +       err = of_property_read_u32(np, "pwm_typen_period", &period);
> +       if (!err) {
> +               success = set_clock_values(pwm_typen_freq, period, TYPEN, base);
> +               if (!success)
> +                       return -EINVAL;
> +       }
> +
> +       err = of_property_read_u32(np, "pwm_typeo_period", &period);
> +       if (!err) {
> +               success = set_clock_values(pwm_typeo_freq, period, TYPEO, base);
> +               if (!success)
> +                       return -EINVAL;
> +       }
> +
> +       for_each_child_of_node(np, child) {
> +               aspeed_create_pwm_port(&pdev->dev,
> +                               child, base);
> +               of_node_put(child);
> +       }
> +       of_node_put(np);
> +
> +       return 0;
> +}
