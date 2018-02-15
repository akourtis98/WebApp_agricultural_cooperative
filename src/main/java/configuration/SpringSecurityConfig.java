package configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

@Configuration
@ImportResource(
{
    "classpath:WEB-INF/webSecurityConfig.xml"
})
public class SpringSecurityConfig
{

    public SpringSecurityConfig()
    {
        super();
    }
}
