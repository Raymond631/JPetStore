package cn.tdsmy.JPetStore.Entity;

import java.io.Serializable;

/**
 * @Author: Raymond Li
 * @Date: 2022/11/7 10:07
 * @Version 1.0
 */
public class Profile implements Serializable
{
    private static final long serialVersionUID = 6045804165673201498L;

    private String languagePreference;
    private String favouriteCategory;
    private String enableMyList;
    private String enableMyBanner;

    public Profile(String languagePreference, String favouriteCategory, String enableMyList, String enableMyBanner)
    {
        this.languagePreference = languagePreference;
        this.favouriteCategory = favouriteCategory;
        this.enableMyList = enableMyList;
        this.enableMyBanner = enableMyBanner;
    }

    public Profile()
    {
        this.languagePreference = "English";
        this.favouriteCategory = "Dogs";
        this.enableMyList = "true";
        this.enableMyBanner = "true";
    }

    public String getLanguagePreference()
    {
        return languagePreference;
    }

    public void setLanguagePreference(String languagePreference)
    {
        this.languagePreference = languagePreference;
    }

    public String getFavouriteCategory()
    {
        return favouriteCategory;
    }

    public void setFavouriteCategory(String favouriteCategory)
    {
        this.favouriteCategory = favouriteCategory;
    }

    public String getEnableMyList()
    {
        return enableMyList;
    }

    public void setEnableMyList(String enableMyList)
    {
        this.enableMyList = enableMyList;
    }

    public String getEnableMyBanner()
    {
        return enableMyBanner;
    }

    public void setEnableMyBanner(String enableMyBanner)
    {
        this.enableMyBanner = enableMyBanner;
    }
}
